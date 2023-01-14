import 'dart:convert';
import 'package:dreamforest/profile.dart';
import 'package:flutter/material.dart';
import 'package:dreamforest/store_class.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 12.0,
      top: 80.0,
      child: Container(
        alignment: Alignment.topLeft,
        child: FloatingActionButton(
          onPressed: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            final url = Uri.parse("http://13.124.141.14:8080/user/info");
            final token = prefs.getString('token')!;
            Map data = {'token': token};
            var body = jsonEncode(data);
            http.Response res = await http.post(url,
                headers: {"Content-Type": "application/json"}, body: body);
            var id = res.body.split('"')[5];
            var nickname = res.body.split('"')[13];
            var idx = res.body.split('"')[2];
            idx = idx.substring(1, idx.indexOf(","));
            var password = prefs.getString('password')!;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Profile(nickname, id, password, idx)));
          },
          child: Icon(
            Icons.account_circle,
            size: 40,
          ),
          backgroundColor: Color.fromARGB(255, 149, 188, 231),
        ),
      ),
    );
  }
}
