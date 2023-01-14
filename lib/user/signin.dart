import 'package:dreamforest/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<SignInPage> {

  String nickname = "";
  String id = "";
  String password = "";

  void FlutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            // title: Column(
            //   children: <Widget>[
            //     Text("Dialog Title"),
            //   ],
            // ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "회원정보가 잘못되었습니다.",
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "확인",
                  style: TextStyle(color: Color.fromARGB(255, 2, 171, 92),),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 390,
              decoration: BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black26,
                      offset: new Offset(0.0, 2.0),
                      blurRadius: 25.0,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32))),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(16),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 2, 171, 92),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      'Welcome Back to DreamForest.',
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      'Let\'s get started',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'ID',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      onChanged: (text) {
                        setState(() {
                          id = text;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      onChanged: (text) {
                        setState(() {
                          password = text;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 2, 171, 92), shape: BoxShape.circle),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 2, 171, 92), shape: BoxShape.circle),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: ()  async {
                                try{
                                  final url = Uri.parse("http://13.124.141.14:8080/user/login");

                                  Map data={"email": id, "password": password};
                                  var body = json.encode(data);
                                  http.Response res = await http.post(
                                      url,
                                      headers: {"Content-Type": "application/json"},
                                      body: body
                                  );
                                  var token = res.body.split('"')[3];
                                  // print(token);
                                  print(res.body.split('"'));
                                  final url1 = Uri.parse("http://13.124.141.14:8080/user/info");
                                  Map data1 = {"token":res.body.split('"')[3]};
                                  var body1 = json.encode(data1);
                                  http.Response res1 = await http.post(
                                      url1,
                                      headers: {"Content-Type": "application/json"},
                                      body: body1
                                  );
                                  print(res1.body.split('"'));
                                  nickname = res1.body.split('"')[13];
                                  String id_idx = res1.body.split('"')[2];
                                  String idx = id_idx.substring(1, id_idx.indexOf(','));
                                  print(idx);

                                  if (token != 'user not found!') {
                                    print('맞음');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Profile(nickname, id, password, idx)));
                                  } else {
                                    FlutterDialog();
                                    print("틀림");
                                  }
                                } catch(e) {
                                  FlutterDialog();
                                  print("fsfd");
                                }
                              },
                              icon: Icon(Icons.arrow_forward),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
