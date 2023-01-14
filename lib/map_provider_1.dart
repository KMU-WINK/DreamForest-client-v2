import 'package:flutter/foundation.dart';
import './location_service.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart'
    show LocationTrackingMode;

import './location_class.dart';
import 'package:naver_map/custom_class/marker_class.dart';
import 'package:naver_map/custom_class/store_class.dart';
import './practice_data.dart';

class MapProvider with ChangeNotifier {
  final LocationService _locationService = LocationService();
  final LocationClass initLocation = LocationService.initLocation;

  final List<CustomMarker> myMarkers = PracticeData.myMarkers();

  MapProvider() {
    Future(this.setCurrentLocation);
  }

  StoreType? _selectedStore;
  StoreType? get selectedStore => this._selectedStore;
  set selectedStore(StoreType? s) => throw "error";

  LocationTrackingMode _trackingMode = LocationTrackingMode.None;
  LocationTrackingMode get trackingMode => this._trackingMode;
  set trackingMode(LocationTrackingMode m) => throw "error";

  Future<void> setCurrentLocation() async {
    if (await this._locationService.canGetCurrentLocation()) {
      this._trackingMode = LocationTrackingMode.Follow;
      this.notifyListeners();
    }
  }

  void onTapMarker(String uid) {
    final StoreType _store =
        PracticeData.myStores.firstWhere((StoreType s) => s.uid == uid);
    this._selectedStore = _store;
    this.notifyListeners();
  }
}
