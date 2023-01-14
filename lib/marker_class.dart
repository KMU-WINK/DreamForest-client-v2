import 'package:flutter/cupertino.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart'
    show Marker, OverlayImage;

import 'store_class.dart';

class CustomMarker extends Marker {
  final Store store;

  CustomMarker(
      {required this.store,
      required super.position,
      super.width = 30,
      super.height = 45})
      : super(markerId: store.id.toString(), captionText: store.storeName);

  factory CustomMarker.fromMyStores(Store store) =>
      CustomMarker(store: store, position: store.location);

  Future<void> createImage(BuildContext context) async {
    this.icon = await OverlayImage.fromAssetImage(
        assetName: 'assets/images/markerImage.png', context: context);
  }

  void setOnMarkerTab(
      void Function(Marker marker, Map<String, int> iconSize) callBack) {
    // print(this.store.id);
    this.onMarkerTab = callBack;
  }
}
