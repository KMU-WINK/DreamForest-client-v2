import 'package:dreamforest/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NicknameEdit extends StatefulWidget {
  String nickname = "";
  String id = "";
  String password = "";
  String idx = "";
  NicknameEdit(this.nickname, this.id, this.password, this.idx);

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<NicknameEdit> {
  String input_nickname = "";

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
              height: 320,
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
                            'Nickname Edit',
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
                      'Write Your New Nickname.',
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
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'New Nickname',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      onChanged: (text) {
                        setState(() {
                          input_nickname = text;
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
                              onPressed: () async {
                                final url = Uri.parse("http://13.124.141.14:8080/user/update/${widget.idx}");

                                Map data={"email": widget.id, "name": "d", "nickname": input_nickname, "password": widget.password};
                                var body = json.encode(data);
                                http.Response res = await http.put(
                                    url,
                                    headers: {"Content-Type": "application/json"},
                                    body: body
                                );
                                // print(res.body);
                                // print(widget.idx);

                                Navigator.push(
                                    context,
                                    
                                    MaterialPageRoute(builder: (context) => Profile(input_nickname, widget.id, widget.password, widget.idx)));
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