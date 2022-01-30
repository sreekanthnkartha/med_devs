import 'package:flutter/material.dart';
import 'package:med_devs/Doctor/appodoc.dart';
import 'package:med_devs/Hospital/hosdata.dart';
import 'package:med_devs/Hospital/hospital.dart';
import 'package:med_devs/Maternity/Others/news.dart';
import 'package:med_devs/Maternity/tools/counter.dart';
import 'package:med_devs/Maternity/tools/weight.dart';
import 'package:med_devs/Style/extension.dart';
import 'package:med_devs/Style/textst.dart';
import 'package:med_devs/Style/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Mat extends StatefulWidget {
  const Mat({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Mat> {
  late List<HosModel> doctorDataList;
  @override
  void initState() {
    doctorDataList = hosMapList.map((x) => HosModel.fromJson(x)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 20,
                ),
                Image(
                  fit: BoxFit.cover,
                  height: 325,
                  image: NetworkImage(
                      'https://images.hindustantimes.com/rf/image_size_960x540/HT/p2/2018/06/28/Pictures/newborns-effort-facilities-needed-pregnant-provide-basic_78e8dd6e-7ab6-11e8-8d5f-3f0c905295d2.jpg'),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, right: 16, left: 16, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Tools", style: TextStyles.title.bold),
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
                                    "",
                                    "https://media.istockphoto.com/photos/closeup-detail-of-two-adorable-little-baby-feet-picture-id157281452?k=20&m=157281452&s=170667a&w=0&h=WvfWyS6fGKf-usbRNNlZgSnPx6HXoTfCVp49Kepqcio=",
                                    color: Colors.green,
                                    lightColor: Colors.greenAccent),
                                onDoubleTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Counter())),
                                onLongPress: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Counter())),
                              ),
                              GestureDetector(
                                child: _categoryCard("", "",
                                    "https://health.clevelandclinic.org/wp-content/uploads/sites/3/2019/09/gainLoseWeight-1137100432-770x553.jpg",
                                    color: Colors.green,
                                    lightColor: Colors.greenAccent),
                                onDoubleTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Weight())),
                                onLongPress: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Weight())),
                              ),
                              GestureDetector(
                                child: _categoryCard("Food Scanner", "",
                                    "https://i1.wp.com/thespoon.tech/wp-content/uploads/2021/02/UA_MealScan_Almond_1504x944-752x472-1.jpg?fit=752%2C472&ssl=1",
                                    color: Colors.orange,
                                    lightColor: Colors.orange),
                                // onDoubleTap: () => Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //         builder: (context) => DocAPPo())),
                                // onLongPress: () => Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //         builder: (context) => DocAPPo())),
                              ),
                              GestureDetector(
                                child: _categoryCard("", "",
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdMWP_4HTVn08qluOgIkmmddTSve-qBw1kIg&usqp=CAU",
                                    color: Colors.orange,
                                    lightColor: Colors.orange),
                                onDoubleTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => DocAPPo())),
                                onLongPress: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => DocAPPo())),
                              ),
                            ],
                          ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, right: 16, left: 16, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Others", style: TextStyles.title.bold),
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
                                "For You",
                                "",
                                "https://images.indianexpress.com/2021/01/ivf-baby-fb.jpg",
                                color: Colors.green,
                                lightColor: Colors.lightGreen),
                                onDoubleTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => News())),
                                onLongPress: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => News())),
                          ),
                          GestureDetector(
                            child: _categoryCard("Timeline", "",
                                "https://static8.depositphotos.com/1472772/979/i/950/depositphotos_9790830-stock-photo-hourglass-sandglass-sand-timer-sand.jpg",
                                color: Color(0xff71b4fb),
                                lightColor: Colors.lightBlue),
                                onDoubleTap: () => Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DocAPPo())),
                                    onLongPress: () =>  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DocAPPo())),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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

  _launchURL() async {
    print("ererge");
    const url =
        'https://www.calculator.net/pregnancy-weight-gain-calculator.html';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
