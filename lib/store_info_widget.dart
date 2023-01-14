import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dreamforest/store_detail.dart';
import 'package:dreamforest/store_class.dart';
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
        height: 250.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "가게 이름:  ${this.store?.storeName}",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 46, 85, 114)),
            ),
            Text(
              "업종:  ${this.store?.type}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text("전화번호:  ${this.store?.phoneNumber}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text("주소:  ${this.store?.roadAddress}",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            TextButton(
                onPressed: () async {
                  print(store.naverMenus);
                  // print(this.store?.id);
                  final url = Uri.parse(
                      "http://13.124.141.14:8080/review/${this.store.id}");
                  final response = await http.get(url);
                  List<dynamic> reviewList =
                      jsonDecode(utf8.decode(response.bodyBytes));
                  final url1 = Uri.parse(
                      "http://13.124.141.14:8080/store/detail/${this.store.id}");
                  final response1 = await http.get(url1);
                  Store store1 = Store.fromJson(
                      jsonDecode(utf8.decode(response1.bodyBytes)));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoreDetail(
                              store: store1,
                              reviewList: reviewList,
                            )),
                  );
                },
                child: Text('가게 자세히 보기',
                    style: TextStyle(fontSize: 20, color: Colors.blue)))
          ],
        ),
      ),
    );
  }
}
