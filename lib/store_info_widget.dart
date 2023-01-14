import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dreamforest/store_detail.dart';
import 'package:dreamforest/store_class.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class StoreInfoWidget extends StatelessWidget {
  const StoreInfoWidget({Key? key, required this.store}) : super(key: key);
  final Store store;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      bottom: 0.0,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 2.0, spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 4.0,
                  spreadRadius: 2.0),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 6.0,
                  spreadRadius: 5.0),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10.0,
                  spreadRadius: 12.0),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 12.0,
                  spreadRadius: 14.0),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0))),
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("가계이름:  ${this.store?.storeName}"),
            Text("업종:     ${this.store?.type}"),
            Text("전화번호:  ${this.store?.phoneNumber}"),
            Text("주소:     ${this.store?.roadAddress}"),
            TextButton(
                onPressed: () async {
                  // print(this.store?.id);
                  // final url = Uri.parse(
                  //     "http://13.124.141.14:8080/store/detail/${this.store.id}");
                  // final response = await http.get(url);
                  // Store tmp_store = Store.fromJson(
                  //     jsonDecode(utf8.decode(response.bodyBytes)));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoreDetail(
                              store: store,
                            )),
                  );
                },
                child: Text('더보기',
                    style: TextStyle(fontSize: 13, color: Colors.blue)))
          ],
        ),
      ),
    );
  }
}
