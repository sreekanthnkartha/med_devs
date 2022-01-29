import 'dart:math';
import 'package:flutter/material.dart';
import 'lcolor.dart';
import 'textst.dart';
import 'theme.dart';
import 'extension.dart';
import 'data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'docmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<DoctorModel> doctorDataList;
  @override
  void initState() {
    doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
    super.initState();
  }

  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      LightColor.orange,
      LightColor.green,
      LightColor.grey,
      LightColor.lightOrange,
      LightColor.skyBlue,
      LightColor.titleTextColor,
      Colors.red,
      Colors.brown,
      LightColor.purpleExtraLight,
      LightColor.skyBlue,
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
            color: LightColor.black,
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
                    const Text("Peter Parker",
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
                        color: LightColor.grey.withOpacity(.3),
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
                              const Icon(Icons.search, color: LightColor.purple)
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
                                "Chemist & Drugist",
                                "350 + Stores",
                                "https://c.files.bbci.co.uk/D505/production/_115033545_gettyimages-1226314512.jpg",
                                color: LightColor.green,
                                lightColor: LightColor.lightGreen),
                                onLongPress: ()
                                {
                                  print("ewed");
                                  _launchURL();
                                },
                            onTap: () {
                              setState(() {
                                print("fdff");
                                _launchURL();
                              });
                            },
                          ),
                          _categoryCard("Covid - 19 Specialist", "899 Doctors",
                              "https://c.files.bbci.co.uk/D505/production/_115033545_gettyimages-1226314512.jpg",
                              color: LightColor.skyBlue,
                              lightColor: LightColor.lightBlue),
                          _categoryCard(
                              "Cardiologists Specialist",
                              "500 + Doctors",
                              "https://c.files.bbci.co.uk/D505/production/_115033545_gettyimages-1226314512.jpg",
                              color: LightColor.orange,
                              lightColor: LightColor.lightOrange),
                          _categoryCard("Dermatologist", "300 + Doctors",
                              "https://c.files.bbci.co.uk/D505/production/_115033545_gettyimages-1226314512.jpg",
                              color: LightColor.green,
                              lightColor: LightColor.lightGreen),
                          _categoryCard("General Surgeon", "500 + Doctors",
                              "https://c.files.bbci.co.uk/D505/production/_115033545_gettyimages-1226314512.jpg",
                              color: LightColor.skyBlue,
                              lightColor: LightColor.lightBlue)
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
                    Text("Top Doctors", style: TextStyles.title.bold),
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
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
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
                      child: Text(title, style: titleStyle).hP8,
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

  Widget _doctorTile(DoctorModel model) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 10,
            color: LightColor.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: const Offset(-3, 0),
            blurRadius: 15,
            color: LightColor.grey.withOpacity(.1),
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
                fit: BoxFit.contain,
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
        // Navigator.pushNamed(context, "/DetailPage", arguments: model);
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
