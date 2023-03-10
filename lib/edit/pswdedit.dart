import 'package:dreamforest/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PasswordEdit extends StatefulWidget {
  String nickname;
  String id;
  String password;
  String idx;
  PasswordEdit(this.nickname, this.id, this.password, this.idx);

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<PasswordEdit> {
  String input_password = "";
  String confirm_password = "";

  void FlutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
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
                  "비밀번호가 일치하지 않습니다.",
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "확인",
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 171, 92),
                  ),
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
              height: 400,
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
                            'Password Edit',
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
                            '',
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
                      'Write Your New Password.',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      '',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: TextField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'New Password',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      onChanged: (text) {
                        setState(() {
                          input_password = text;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: TextField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      onChanged: (text) {
                        setState(() {
                          confirm_password = text;
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
                                color: Color.fromARGB(255, 2, 171, 92),
                                shape: BoxShape.circle),
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
                                color: Color.fromARGB(255, 2, 171, 92),
                                shape: BoxShape.circle),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () async {
                                if (input_password == confirm_password) {
                                  final url = Uri.parse(
                                      "http://13.124.141.14:8080/user/update/${widget.idx}");

                                  Map data = {
                                    "email": widget.id,
                                    "name": "d",
                                    "nickname": widget.nickname,
                                    "password": input_password
                                  };
                                  var body = json.encode(data);
                                  http.Response res = await http.put(url,
                                      headers: {
                                        "Content-Type": "application/json"
                                      },
                                      body: body);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile(
                                              widget.nickname,
                                              widget.id,
                                              input_password,
                                              widget.idx)));
                                } else {
                                  FlutterDialog();
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
