import 'package:flutter/material.dart';
import 'package:med_devs/Prescription/predata.dart';
import 'package:med_devs/Prescription/presdata.dart';
import 'package:med_devs/Style/extension.dart';
import 'package:med_devs/Style/textst.dart'; 
class Pres extends StatefulWidget {
  const Pres({Key? key}) : super(key: key);

  @override
  _PresState createState() => _PresState();
}

class _PresState extends State<Pres> {
  late List<PresModel> doctorDataList;
  bool valuefirst = true;  
  @override
  void initState() {
    doctorDataList = prelist.map((x) => PresModel.fromJson(x)).toList();
    super.initState();
  }

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
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 8),
                  child: Text("Prescription", 
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                  )
                  ),
                ),
                Column(
                    children: doctorDataList.map((x) {
                  return _doctorTile(x);
                }).toList()),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 25,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _doctorTile(PresModel model) {
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
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(15),
              //   color: randomColor(),
              // ),
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
          trailing: Checkbox(
            checkColor: Colors.greenAccent,
            activeColor: Colors.blue,
            value: model.abc,
            onChanged: (bool? value) {
              setState(() {
                model.abc = value!;
              });
            },
          ),
        ),
      )
    );
  }
}
