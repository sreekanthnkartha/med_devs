import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Page/login.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(1), BlendMode.dstATop),
          image: AssetImage("images/logo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
      //     Container(
      //       decoration: BoxDecoration(
      //   image: DecorationImage(
      //     // colorFilter: new ColorFilter.mode(
      //     //     Colors.black.withOpacity(1), BlendMode.dstATop),
      //     image: AssetImage("images/log.png"),
      //     fit: BoxFit.cover,
      //   ),
      // ),
          // ),
          Hero(tag:"hi",
          child: Image(image: AssetImage("images/log.png"),)),
          // Text("League El"),
          SizedBox(
            height: 140,
          ),
          SpinKitThreeInOut(
            color: Colors.black,
            size: 60.0,
          )
        ],
      ),
    ));
  }
}
