import 'package:flutter/material.dart';
import 'package:med_devs/Style/extension.dart';
import 'package:med_devs/Style/textst.dart';
import 'package:med_devs/Style/theme.dart';
import 'docmodel.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.model}) : super(key: key);
  final DoctorModel model;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DoctorModel model;
  @override
  void initState() {
    model = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23).bold;
    }
    return Scaffold(
      backgroundColor: Color(0xffd9eeff),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Image.network(model.image),
            DraggableScrollableSheet(
              maxChildSize: .8,
              initialChildSize: .6,
              minChildSize: .6,
              builder: (context, scrollController) {
                return Container(
                  height: AppTheme.fullHeight(context) * .5,
                  padding: EdgeInsets.only(
                      left: 19,
                      right: 19,
                      top: 16), //symmetric(horizontal: 19, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                model.name,
                                style: titleStyle,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.check_circle,
                                  size: 18,
                                  color: Theme.of(context).primaryColor),
                            ],
                          ),
                          subtitle: Text(
                            model.type,
                            style: TextStyles.bodySm.subTitleColor.bold,
                          ),
                        ),
                        Divider(
                          thickness: .3,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 5.0,
                                    percent: model.goodReviews/100,
                                    center: Text("${model.goodReviews}"),
                                    progressColor: Colors.blueGrey,
                                  ),
                                ),
                                Text("Good Review"),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 5.0,
                                    percent: model.totalScore/100,
                                    center: new Text("${model.totalScore}"),
                                    progressColor: Colors.blueGrey,
                                  ),
                                ),
                                Text("Total Score"),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 5.0,
                                    percent: model.satisfaction/100,
                                    center: new Text("${model.satisfaction}"),
                                    progressColor: Colors.blueGrey,
                                  ),
                                ),
                                Text("Satisfaction"),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          thickness: .3,
                          color: Colors.grey,
                        ),
                        Text("About", style: titleStyle).vP16,
                        Text(
                          model.description,
                          style: TextStyles.body.subTitleColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:  Colors.grey.withAlpha(150)),
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            ).ripple(
                              () {},
                              borderRadius: BorderRadius.circular(10),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withAlpha(150)),
                              child: Icon(
                                Icons.chat_bubble,
                                color: Colors.white,
                              ),
                            ).ripple(
                              () {},
                              borderRadius: BorderRadius.circular(10),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FlatButton(
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        elevation: 3,
                                        title: Text(
                                          "APPOINTMENT SUCCESSFUL",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Icon(
                                          Icons.check_circle_outline_rounded,
                                          size: 80,
                                          color: Colors.green,
                                        ),
                                      ),
                                    );
                              },
                              child: Text(
                                "Make an appointment",
                                style: TextStyles.titleNormal.white,
                              ).p(10),
                            ),
                          ],
                        ).vP16
                      ],
                    ),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BackButton(color: Theme.of(context).primaryColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}
