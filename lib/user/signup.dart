import 'dart:convert';
import 'package:dreamforest/mainscreen.dart';
import 'package:dreamforest/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<SignUpPage> {
  String nickname = "";
  String id = "";
  String password ="";

  void CompleteDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "회원가입에 성공했습니다.",
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
              ),
            ],
          );
        });
  }

  void FlutterDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "이미 존재하는 회원입니다.",
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

  void SignupDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "입력이 올바르지 않습니다.",
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
              height: 490,
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
                              color: Colors.grey,
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
                              color: Color.fromARGB(255, 2, 171, 92),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      'Welcome to DreamForest.',
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
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 32, bottom: 8),
                    child: TextField(
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Nickname',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      onChanged: (text) {
                        setState(() {
                          nickname = text;
                        });
                      },
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
                                try {
                                  final url = Uri.parse("http://13.124.141.14:8080/user/signup");

                                  Map data={"email": id, "name": "d", "nickname": nickname, "password": password};
                                  var body = json.encode(data);
                                  http.Response res = await http.post(
                                      url,
                                      headers: {"Content-Type": "application/json"},
                                      body: body
                                  );
                                  // print(res.body);
                                  // print(res.body.split('"'));
                                  // var token = res.body.split('"')[3];
                                  // final url1 = Uri.parse("http://13.124.141.14:8080/user/info");
                                  // Map data1 = {"token":res.body.split('"')[3]};
                                  // var body1 = json.encode(data1);
                                  // http.Response res1 = await http.post(
                                  //     url1,
                                  //     headers: {"Content-Type": "application/json"},
                                  //     body: body1
                                  // );
                                  // print(res1.body.split('"'));
                                  var id_idx = res.body.split('"')[2];
                                  String idx = id_idx[1];
                                  print(idx);
                                  if (res.statusCode == 400) {
                                    FlutterDialog();
                                    print("여기?");
                                  } else if (id == "" || nickname == "" || password == "" ) {
                                    SignupDialog();
                                    print("빈칸");
                                  }
                                  else {
                                    CompleteDialog();
                                    print("성공");
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(builder: (context) =>
                                    //         Profile(
                                    //             nickname, id, password, idx)));
                                  }
                                } catch (e) {
                                  if (id == "" || nickname == "" || password == "") {
                                      SignupDialog();
                                      print("asdf");
                                  } else FlutterDialog();
                                }
                              },
                              icon: Icon(Icons.done),
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