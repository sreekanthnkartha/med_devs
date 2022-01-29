import 'package:flutter/material.dart';
import 'package:med_devs/Style/extension.dart';
import 'package:med_devs/Style/lcolor.dart';
import 'package:med_devs/Style/textst.dart';
import 'doctorpage.dart';
import 'data.dart';
import 'docmodel.dart';
class DocAPPo extends StatefulWidget {
  const DocAPPo({ Key? key }) : super(key: key);

  @override
  _DocAPPoState createState() => _DocAPPoState();
}

class _DocAPPoState extends State<DocAPPo> {
  late List<DoctorModel> doctorDataList;
  @override
  void initState() {
    doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
    super.initState();
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
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(15),
              //   color: randomColor(),
              // ),
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(model: model,)));
        // Navigator.pushNamed(context, "/DetailPage", arguments: model);
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
      body: CustomScrollView(
        slivers: <Widget>[
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
            ),]
      ),
    );
  }
}