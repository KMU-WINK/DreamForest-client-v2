import 'package:dreamforest/main_page.dart';
import 'package:flutter/foundation.dart';
import './location_service.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart'
    show LocationTrackingMode;

import './location_class.dart';
import 'package:dreamforest/marker_class.dart';
import 'package:dreamforest/store_class.dart';

class MapProvider with ChangeNotifier {
  final LocationService _locationService = LocationService();
  final LocationClass initLocation = LocationService.initLocation;

  List<CustomMarker> myMarkers = [];

  MapProvider() {
    Future(this.setCurrentLocation);
  }

  Store? _selectedStore;
  Store? get selectedStore => this._selectedStore;
  set selectedStore(Store? s) => throw "error";

  LocationTrackingMode _trackingMode = LocationTrackingMode.None;
  LocationTrackingMode get trackingMode => this._trackingMode;
  set trackingMode(LocationTrackingMode m) => throw "error";

  Future<void> setCurrentLocation() async {
    if (await this._locationService.canGetCurrentLocation()) {
      this._trackingMode = LocationTrackingMode.Follow;
      this.notifyListeners();
    }
  }

  void onTapMarker(String id) {
    var myStores = Main_Page.getMysStores();
    final Store _store = myStores.firstWhere((Store s) => s.id == id);
    this._selectedStore = _store;
    this.notifyListeners();
  }
}
