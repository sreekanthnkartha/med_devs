import 'package:flutter/material.dart';
import 'package:med_devs/Maternity/Others/newsdata.dart';
import 'package:med_devs/Maternity/Others/newsmodel.dart';
import 'package:med_devs/Style/extension.dart';
import 'package:med_devs/Style/textst.dart';

class News extends StatefulWidget {
  const News({ Key? key }) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  late List<NewsModel> doctorDataList;
  @override
  void initState() {
    doctorDataList = NewsList.map((x) => NewsModel.fromJson(x)).toList();
    super.initState();
  }
   Widget _doctorTile(NewsModel model) {
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
            color: Colors.grey..withOpacity(.1),
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
              child: Image.network(
                model.image,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
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
      }, borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
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
            ),
          ).p(8),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
         SliverList(
              delegate: SliverChildListDelegate(
                [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Top News", style: TextStyles.title.bold),
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
            ),]
      ),
    );
  }
}