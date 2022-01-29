import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
// import 'package:reservationapp/booktickets.dart';
import 'registration.dart';
import 'styles.dart';

//If you use getx state management, stateless widgets are enough.
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //call our controller here
  @override
  IconData id = Icons.visibility_off;
  bool _obscuretext = true;
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: 350,
                    image: NetworkImage(
                        'https://wallpaperboat.com/wp-content/uploads/2020/11/23/61328/steam-train-02.jpg'),
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
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(23),
                      child: ListView(
                        shrinkWrap:
                            true, //you must add this if you place listview inside scrollview
                        physics:
                            NeverScrollableScrollPhysics(), //to prevent default scrolling of listview
                        children: <Widget>[
                          TextField(
                              style: inputstyle(),
                              // controller: uc.uname,
                              decoration:
                                  inputdec("Username", Icons.person_outline)),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            obscureText: _obscuretext,
                            style: inputstyle(),
                            // controller: uc.pwd,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(id),
                                    color: Colors.black,
                                    onPressed: () {
                                      setState(() {
                                        _obscuretext = !_obscuretext;
                                        if (_obscuretext)
                                          id = Icons.visibility_off;
                                        else
                                          id = Icons.visibility;
                                      });
                                    }),
                                fillColor: Colors.white,
                                filled: true,
                                border: new OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.cyan)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontSize: 16, // or whatever
                                  color: Colors.grey,
                                  height:
                                      2.2, //                                <----- this was the key
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                contentPadding: EdgeInsets.all(0),
                                isDense: true,
                                hintText: "Password"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: MaterialButton(
                              onPressed: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => BOOK_TICKETS()));
                              }, //since this is only a UI app
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'SFUIDisplay',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.cyan, //Color(0xffff2d55),
                              elevation: 0,
                              minWidth: 400,
                              height: 50,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          //obx are used for rendering reactive variables
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New user ?",
                              ),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => RegPage()));
                                  },
                                  child: Text("Register now",
                                      style: TextStyle(
                                          color: Colors.red[800],
                                          fontSize: 18,
                                          decoration:
                                              TextDecoration.underline)))
                            ],
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
}
