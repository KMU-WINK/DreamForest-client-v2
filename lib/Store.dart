import 'package:flutter/material.dart';
import 'dart:convert';

Store? storeFromJson(String str) => Store.fromJson(json.decode(str));

String storeToJson(Store? data) => json.encode(data!.toJson());

class Store {
    Store({
        required this.id,
        required this.type,
        required this.storeName,
        required this.roadAddress,
        required this.phoneNumber,
        required this.naverBizHour,
        required this.naverMenus,
        required this.naverMenuImages,
    });

    int id;
    String type;
    String storeName;
    String roadAddress;
    String phoneNumber;
    var naverBizHour;
    var naverMenus;
    var naverMenuImages;

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        type: json["type"],
        storeName: json["store_name"] == null ? 'null' : json["store_name"],
        roadAddress: json["road_address"] == null ? 'null' : json["road_address"],
        phoneNumber: json["phone_number"] == null ? 'null' : json["phone_number"],
        naverBizHour: json["naver_biz_hour"] == null ? 'null' : jsonDecode(json["naver_biz_hour"]),
        naverMenus: json["naver_menus"] == null ? 'null' : jsonDecode(json["naver_menus"]),
        naverMenuImages: json["naver_menu_images"] == null ? 'null' : jsonDecode(json["naver_menu_images"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "store_name": storeName,
        "road_address": roadAddress,
        "phone_number": phoneNumber,
        "naver_biz_hour": naverBizHour,
        "naver_menus": naverMenus,
        "naver_menu_images": naverMenuImages,
    };

}
class Menu {
  final String? name, price;
  final int? id;
  Menu({
    this.id,
    this.name,
    this.price,
  });
  String toString() => '{$id, $name, $price}';
}

// List<Map<String, String>> menuMap = [
//   {'name': '통새우와퍼주니어세트', 'price': '7,200원'},
//   {'name': '통새우와퍼세트', 'price': '9,700원'},
//   {'name': '와퍼세트', 'price': '8,900원'},
//   {'name': '콰트로치즈와퍼세트', 'price': '9,700원'},
//   {'name': '치즈와퍼세트', 'price': '9,500원'},
//   {'name': '와퍼주니어세트', 'price': '6,600원'},
//   {'name': '불고기와퍼주니어', 'price': '6,600원'},
//   {'name': '콰트로치즈와퍼주니어', 'price': '7,200원'},
//   {'name': '치즈와퍼주니어', 'price': '6,900원'},
//   {'name': '프렌치프라이(R)~(L)', 'price': '2,000~2,500원'},
//   {'name': '어니언링', 'price': '2,300원'},
//   {'name': '너켓킹(4~10조각)', 'price': '2,800~6,400원'}
// ];

// List<Menu> menus = [
//   Menu(
//     id: 1,
//     name : menuMap[0]['name'],
//     price : menuMap[0]['price'],
//     image: "assets/images/food.png"
//   ),
//   Menu(
//     id: 2,
//     name : menuMap[1]['name'],
//     price : menuMap[1]['price'],
//     image: "assets/images/food.png"
//   ),
//   Menu(
//     id: 3,
//     name : menuMap[2]['name'],
//     price : menuMap[2]['price'],
//     image: "assets/images/food.png"
//   ),
//   Menu(
//     id: 4,
//     name : menuMap[3]['name'],
//     price : menuMap[3]['price'],
//     image: "assets/images/food.png"
//   ),
//   Menu(
//     id: 5,
//     name : menuMap[4]['name'],
//     price : menuMap[4]['price'],
//     image: "assets/images/food.png"
//   ),
// ];

// void addMenu(List<Map<String, String>> menuMap){
//     menuMap.forEach((menuList) { 
//     int i = 1;
//     menus.add(
//       Menu(
//         id: i,
//         name : menuList['name'],
//         price : menuList['price']
//       )
//     );
//     i++;
//   });
// }


