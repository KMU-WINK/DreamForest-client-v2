import 'package:flutter/material.dart';
import 'dart:convert';
import 'location_class.dart';
import 'marker_class.dart';

Store? storeFromJson(String str) => Store.fromJson(json.decode(str));

String storeToJson(Store? data) => json.encode(data!.toJson());

class Store {
  Store(
      {required this.id,
      required this.type,
      required this.storeName,
      required this.roadAddress,
      required this.phoneNumber,
      required this.naverBizHour,
      required this.naverMenus,
      required this.naverMenuImages,
      required this.location,
      required this.markerImage});
  LocationClass location =
      LocationClass(latitude: 37.611035490773, longitude: 126.99457310622);
  int id;
  String type;
  String storeName;
  String roadAddress;
  String phoneNumber;
  var naverBizHour;
  var naverMenus;
  var naverMenuImages;
  String markerImage = "assets/images/markerImage.png";

  factory Store.fromJson(Map<String, dynamic> json) => Store(
      id: json["id"],
      type: json["type"],
      storeName: json["store_name"],
      roadAddress: json["road_address"],
      phoneNumber: json["phone_number"],
      naverBizHour: json["naver_biz_hour"] == null
          ? 'null'
          : jsonDecode(json["naver_biz_hour"]),
      naverMenus: json["naver_menus"] == null
          ? 'null'
          : jsonDecode(json["naver_menus"]),
      naverMenuImages: json["naver_menu_images"] == null
          ? 'null'
          : jsonDecode(json["naver_menu_images"]),
      location:
          LocationClass(latitude: json["naver_y"], longitude: json["naver_x"]),
      markerImage: "assets/images/markerImage.png");

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "store_name": storeName,
        "road_address": roadAddress,
        "phone_number": phoneNumber,
        "naver_biz_hour": naverBizHour,
        "naver_menus": naverMenus,
        "naver_menu_images": naverMenuImages,
        "location": location,
        "markerImage": markerImage
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
