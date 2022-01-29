import 'package:flutter/material.dart';
import 'package:med_devs/Doctor/appodoc.dart';
import 'package:med_devs/Maternity/Bmi/screens/input_page.dart';
import 'package:med_devs/Maternity/tools/counter.dart';
import 'package:med_devs/Style/extension.dart';
// import 'package:med_devs/Style/lcolor.dart';
import 'package:med_devs/Style/textst.dart';
import 'package:med_devs/Style/theme.dart';

class Maternity extends StatefulWidget {
  const Maternity({ Key? key }) : super(key: key);

  @override
  _MaternityState createState() => _MaternityState();
}

class _MaternityState extends State<Maternity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: <Widget>[
                  //Now our code is much improved
                  SizedBox(
                    height: 20,
                  ),
                  Image(
                    fit: BoxFit.cover,
                    height: 325,
                    image: NetworkImage(
                        'https://images.hindustantimes.com/rf/image_size_960x540/HT/p2/2018/06/28/Pictures/newborns-effort-facilities-needed-pregnant-provide-basic_78e8dd6e-7ab6-11e8-8d5f-3f0c905295d2.jpg'),
                  ),
                  // CachedNetworkImage(
                  //   fit: BoxFit.cover,
                  //   imageUrl: "https://wallpaperboat.com/wp-content/uploads/2020/11/23/61328/steam-train-02.jpg"
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey[100],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(23),
                      child: Column(
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
                                "Baby Kicker",
                                "3 days left ...",
                                "https://media.istockphoto.com/photos/closeup-detail-of-two-adorable-little-baby-feet-picture-id157281452?k=20&m=157281452&s=170667a&w=0&h=WvfWyS6fGKf-usbRNNlZgSnPx6HXoTfCVp49Kepqcio=",
                                color: Colors.green,
                                lightColor: Colors.greenAccent),
                                onDoubleTap: () => Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Counter())),
                                    onLongPress: () =>  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Counter())),
                          ),
                          GestureDetector(
                            child: _categoryCard(
                                "Bmi",
                                "3 days left ...",
                                "https://media.istockphoto.com/photos/closeup-detail-of-two-adorable-little-baby-feet-picture-id157281452?k=20&m=157281452&s=170667a&w=0&h=WvfWyS6fGKf-usbRNNlZgSnPx6HXoTfCVp49Kepqcio=",
                                color: Colors.green,
                                lightColor: Colors.greenAccent),
                                onDoubleTap: () => Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => InputPage())),
                                    onLongPress: () =>  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => InputPage())),
                          ),
                          GestureDetector(
                            child: _categoryCard(
                                "",
                                "50 + Doctors",
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy1vYq5hVWmM-oOUPrrZFo9QbaEKyhn01ZZfXxhin_77HDR6URtD6lbb4iRxJWshgTLYY&usqp=CAU",
                                color: Colors.orange,
                                lightColor: Colors.orange),
                                onDoubleTap: () => Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DocAPPo())),
                                    onLongPress: () =>  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DocAPPo())),
                          ),
                           GestureDetector(
                            child: _categoryCard("", "899 Doctors",
                                "https://cdn-icons-png.flaticon.com/512/3158/3158990.png",
                                color: Colors.blue,
                                lightColor: Colors.lightBlueAccent),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
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
      aspectRatio: 12 / 14,
      child: Container(
        // height: 280,
        width: AppTheme.fullWidth(context) * .3,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
        decoration: BoxDecoration(
          // color: color,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Text(title,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    ),
                    // SizedBox(height: 10),
                    // Flexible(
                    //   child: Text(
                    //     subtitle,
                    //     style: subtitleStyle,
                    //   ).hP8,
                    // ),
                  ],
                ).p16
              ],
            ),
          ),
        ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
  
}