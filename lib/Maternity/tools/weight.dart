import 'package:flutter/material.dart';
import 'package:med_devs/Style/styles.dart';

class Weight extends StatefulWidget {
  @override
  State<Weight> createState() => _LoginPageState();
}

class _LoginPageState extends State<Weight> {
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
            children: [
              Stack(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image(
                    fit: BoxFit.cover,
                    height: 350,
                    image: NetworkImage(
                        'https://economictimes.indiatimes.com/thumb/msid-73074326,width-1200,height-900,resizemode-4,imgsize-80591/health-insurance-getty-imag.jpg?from=mdr'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 330),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(27),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          Text(
                            "Enter your weigth",
                            style: TextStyle(
                              fontSize: 18
                            ),
                            ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                              style: inputstyle(),
                              decoration:inputdec("Weight", Icons.line_weight)),
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            "Enter your pulse",
                            style: TextStyle(
                              fontSize: 18
                            ),
                            ),
                            SizedBox(
                            height: 10,
                          ),
                          TextField(
                            obscureText: _obscuretext,
                            style: inputstyle(),
                            decoration: InputDecoration(
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
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontSize: 16, 
                                  color: Colors.grey,
                                  height:2.2,                            
                                ),
                                prefixIcon: Icon(
                                  Icons.headset_rounded,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                contentPadding: EdgeInsets.all(0),
                                isDense: true,
                                hintText: "Pulse"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                'Record',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'SFUIDisplay',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.cyan,
                              elevation: 0,
                              minWidth: 400,
                              height: 50,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
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
}
