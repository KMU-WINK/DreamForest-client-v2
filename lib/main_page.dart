import 'package:dreamforest/store_class.dart';
import 'package:flutter/material.dart';
import 'package:dreamforest/marker_class.dart';
import 'package:dreamforest/store_info_widget.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart' as naver;
import './map_provider_1.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

List<Store> myStores = [];

class Main_Page extends StatefulWidget {
  Main_Page({Key? key, required this.mapProvider}) : super(key: key);
  final MapProvider mapProvider;

  @override
  State<Main_Page> createState() => _Main_PageState();
  static List<Store> getMysStores() {
    return myStores;
  }

  static List<CustomMarker> myMarkers() {
    List<CustomMarker> _list = [];
    myStores.forEach((Store st) => _list.add(CustomMarker.fromMyStores(st)));
    return _list;
  }
}

class _Main_PageState extends State<Main_Page> {
  List<Store> myStores = [];
  List<CustomMarker> _list = [];
  bool _showBottomSheet = false;
  late Store _selectedStore;

  naver.NaverMapController? _ct;
  @override
  void initState() {
    getLocation();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // print(Main_Page.myMarkers());
      if (!this.mounted) return;
      // myMarkers().forEach();
    });
    super.initState();
  }

  List<CustomMarker> myMarkers(context) {
    List<CustomMarker> _list = [];
    myStores.forEach((Store st) => _list.add(CustomMarker.fromMyStores(st)));
    _list.forEach((CustomMarker marker) {
      marker.createImage(context);
      // print(marker);
      marker.setOnMarkerTab(
          (naver.Marker marker, Map<String, int> iconSize) async {
        this._showBottomSheet = true;

        onTapMarker(marker.markerId);
        await this
            ._ct
            ?.moveCamera(naver.CameraUpdate.scrollTo(marker.position));
        // this._ct?.moveCamera(naver.CameraUpdate.fitBounds(bounds));
      });
    });
    // print(_list);

    return _list;
  }

  void onTapMarker(String id) {
    // print(myStores[0].id);
    // print(id);
    final Store _store =
        myStores.firstWhere((Store s) => s.id.toString() == id);
    // this._selectedStore = _store;
    setState(() {
      _selectedStore = _store;
    });

    // print(_store);
    // this.notifyListeners();
  }

  void getLocation() async {
    LocationPermission permission =
        await Geolocator.requestPermission(); //오류 해결 코드
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // print(position);
    final queryParameters = {
      'user_x': '${position.longitude}',
      'user_y': '${position.latitude}',
    };
    final uri =
        Uri.http('13.124.141.14:8080', '/store/search', queryParameters);
    final response = await http.get(uri);
    final store = jsonDecode(utf8.decode(response.bodyBytes));
    // print(response.body);

    for (int i = 0; i < store.length; i++) {
      // print(store[i]);
      Store tmpStore = Store.fromJson(store[i]);

      // print(tmpStore.markerImage);
      setState(() {
        myStores.add(tmpStore);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        naver.NaverMap(
          zoomGestureEnable: true,
          initLocationTrackingMode: this.widget.mapProvider.trackingMode,
          initialCameraPosition: naver.CameraPosition(
              target: this.widget.mapProvider.initLocation),
          locationButtonEnable: true,
          useSurface: true,
          onMapTap: (naver.LatLng ln) {
            this.setState(() {
              this._showBottomSheet = false;
            });
          },
          onMapCreated: (naver.NaverMapController ct) {
            this._ct = ct;
            // getLocation();
          },
          markers: myMarkers(context),
        ),
        this._showBottomSheet
            ? StoreInfoWidget(store: this._selectedStore)
            : Container(),
      ],
    ));
  }
}
