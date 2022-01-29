import 'dart:math';
import 'package:flutter/material.dart';
import 'package:med_devs/Doctor/appodoc.dart';
import 'package:med_devs/Hospital/hosdata.dart';
import 'package:med_devs/Hospital/hospital.dart';
import 'package:med_devs/Maternity/mat.dart';
import 'package:med_devs/Prescription/pres.dart';
import 'package:med_devs/Style/extension.dart';
import 'package:med_devs/Style/textst.dart';
import 'package:med_devs/Style/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<HosModel> doctorDataList;
  @override
  void initState() {
    doctorDataList = hosMapList.map((x) => HosModel.fromJson(x)).toList();
    super.initState();
  }

  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      Colors.orange,
      Colors.green,
      Colors.grey,
      const Color(0xfffa9881),
      Color(0xff71b4fb),
      Color(0xff1b1718),
      Colors.red,
      Colors.brown,
      Color(0xffb1a5f6),
      Color(0xff71b4fb),
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        leading: const Icon(
          Icons.short_text,
          size: 30,
          color: Colors.black,
        ),
        actions: <Widget>[
          const Icon(
            Icons.notifications_none,
            size: 30,
            color: Colors.black,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            child: Container(
              // height: 40,
              // width: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              // child: Image.asset("assets/user.png", fit: BoxFit.fill),
            ),
          ).p(8),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Hello,",
                        style:
                            TextStyle(color: Colors.grey[700], fontSize: 18)),
                    const Text("Rajinikanth",
                        // style: TextStyles.h1Style
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 38)),
                  ],
                ).p16,
                Container(
                  height: 55,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(13)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        blurRadius: 15,
                        offset: const Offset(5, 5),
                      )
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyles.body.subTitleColor,
                      suffixIcon: SizedBox(
                          width: 50,
                          child:
                              const Icon(Icons.search, color: Colors.purple)
                                  .alignCenter
                                  .ripple(() {},
                                      borderRadius: BorderRadius.circular(13))),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, right: 16, left: 16, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Category", style: TextStyles.title.bold),
                          Text(
                            "See All",
                            style: TextStyles.titleNormal.copyWith(
                                color: Theme.of(context).primaryColor),
                          ).p(8).ripple(() {})
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppTheme.fullHeight(context) * .28,
                      width: AppTheme.fullWidth(context),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          GestureDetector(
                            child: _categoryCard(
                                "",
                                "Medicine Shop",
                                "https://cdn.dribbble.com/users/1787323/screenshots/14078370/media/e19e4f7a8042b9fc7df664cc2c277c27.png?compress=1&resize=400x300",
                                color: Colors.green,
                                lightColor: Colors.lightGreen),
                                onLongPress: ()
                                {
                                  print("ewed");
                                  _launchURL();
                                },
                            onDoubleTap: () {
                              setState(() {
                                print("fdff");
                                _launchURL();
                              });
                            },
                          ),
                          GestureDetector(
                            child: _categoryCard("Top Doctors", "899 Doctors",
                                "https://media.istockphoto.com/photos/doctor-work-space-concept-picture-id825461262?k=20&m=825461262&s=612x612&w=0&h=SZ7fXYYTUKi3QbcOGfVWd9pwaBcvQt7lcRfkrpX40IU=",
                                color: Color(0xff71b4fb),
                                lightColor: Colors.lightBlue),
                                onDoubleTap: () => Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DocAPPo())),
                                    onLongPress: () =>  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DocAPPo())),
                          ),
                          GestureDetector(
                            child: _categoryCard(
                                " ",
                                "Maternity Specialist",
                                "https://cdn.dribbble.com/users/1630878/screenshots/6195908/comfort_maternity_2_4x.jpg",
                                color: Colors.orange,
                                lightColor: Color(0xfffa9881)),
                                onDoubleTap: () => Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Mat())),
                                    onLongPress: () =>  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Mat())),
                          ),
                          GestureDetector(
                            child: _categoryCard("Prescription", "",
                                "https://media.istockphoto.com/photos/doctor-filling-out-a-prescription-picture-id1190193669?k=20&m=1190193669&s=612x612&w=0&h=hRT7a6DCTMc7IDfC_QKaPuUOnBT2iUA95GJCEQrRdz4=",
                                color: Colors.green,
                                lightColor: Color(0xff5ed6c3)),
                                onDoubleTap: () => Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Pres())),
                                    onLongPress: () =>  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Pres())),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Health Centers Near you", style: TextStyles.title.bold),
                    IconButton(
                            icon: Icon(
                              Icons.sort,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {})
                        .p(12)
                        .ripple(() {},
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                  ],
                ).hP16,
                Column(
                    children: doctorDataList.map((x) {
                  return _doctorTile(x);
                }).toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryCard(String title, String subtitle, String link,
      {Color? color, required Color lightColor}) {
    TextStyle titleStyle = TextStyles.title.bold.white;
    TextStyle subtitleStyle = TextStyles.body.bold.white;
    if (AppTheme.fullWidth(context) < 392) {
      titleStyle = TextStyles.body.bold.white;
      subtitleStyle = TextStyles.bodySm.bold.white;
    }
    return AspectRatio(
      aspectRatio: 6 / 8,
      child: Container(
        height: 280,
        width: AppTheme.fullWidth(context) * .3,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
        decoration: BoxDecoration(
          // color: color,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstIn),
            image: NetworkImage(link),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: Colors.transparent.withOpacity(.8),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                // Positioned(
                //   top: -20,
                //   left: -20,
                //   child: CircleAvatar(
                //     backgroundColor: lightColor,
                //     radius: 60,
                //   ),
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Text(title,style: (title=="Priscription" )?titleStyle:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white,)).hP8,
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: Text(
                        subtitle,
                        style: subtitleStyle,
                      ).hP8,
                    ),
                  ],
                ).p16
              ],
            ),
          ),
        ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Widget _doctorTile(HosModel model) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 10,
            color: Colors.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: const Offset(-3, 0),
            blurRadius: 15,
            color: Colors.grey.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: randomColor(),
              ),
              child: Image.network(
                model.image,
                height: 50,
                width: 50,
                fit: BoxFit.fitHeight,
              ),
              // child: const Image(
              //   image: NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Fhandsome-doctor&psig=AOvVaw1hdk-_Q7L9gWnUUhmxm3tX&ust=1643535480955000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNjPt_bU1vUCFQAAAAAdAAAAABAD"),
              // ),
            ),
          ),
          title: Text(model.name, style: TextStyles.title.bold),
          subtitle: Text(
            model.type,
            style: TextStyles.bodySm.subTitleColor.bold,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ).ripple(() {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(model: model,)));
        // // Navigator.pushNamed(context, "/DetailPage", arguments: model);
      }, borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }

  _launchURL() async {
    print("ererge");
    const url = 'https://www.netmeds.com/';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
