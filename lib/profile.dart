import 'dart:convert';

import 'package:dreamforest/edit/nicknameedit.dart';
import 'package:dreamforest/edit/pswdcheck.dart';
import 'package:dreamforest/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  String id;
  String nickname;
  String password;
  String idx;
  Profile(this.nickname, this.id, this.password, this.idx);

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<Profile> {
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
              height: 270,
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
                            'Dream Forest',
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
                            'Profile',
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
                    margin: EdgeInsets.only(left: 16, top: 8, right: 16),
                    child: Text(
                      'ID',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      '${widget.id}',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8, right: 16),
                    child: Text(''),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      'NickName',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16, top: 8, right: 16),
                        child: Text(
                          '${widget.nickname}',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.create),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NicknameEdit(
                                          widget.nickname,
                                          widget.id,
                                          widget.password,
                                          widget.idx)));
                            },
                            child: Text(
                              'Change Nickname',
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 171, 92),
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.lock),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PasswordCheck(
                                          widget.nickname,
                                          widget.id,
                                          widget.password,
                                          widget.idx)));
                            },
                            child: Text(
                              'Change Password',
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 171, 92),
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.logout),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()));
                            },
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 171, 92),
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
