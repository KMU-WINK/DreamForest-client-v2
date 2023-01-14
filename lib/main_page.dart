import 'package:flutter/material.dart';
import 'package:naver_map/custom_class/marker_class.dart';
import 'package:naver_map/views/components/store_info_widget.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart' as naver;
import './map_provider_1.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Main_Page extends StatefulWidget {
  Main_Page({Key? key, required this.mapProvider}) : super(key: key);
  final MapProvider mapProvider;

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  bool _showBottomSheet = false;

  naver.NaverMapController? _ct;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!this.mounted) return;
      this.widget.mapProvider.myMarkers.forEach((CustomMarker marker) {
        marker.createImage(context);
        marker.setOnMarkerTab(
            (naver.Marker marker, Map<String, int> iconSize) async {
          this._showBottomSheet = true;
          this.widget.mapProvider.onTapMarker(marker.markerId);
          await this
              ._ct
              ?.moveCamera(naver.CameraUpdate.scrollTo(marker.position));
          // this._ct?.moveCamera(naver.CameraUpdate.fitBounds(bounds));
        });
      });
    });
    super.initState();
  }

  void getLocation() async {
    LocationPermission permission =
        await Geolocator.requestPermission(); //오류 해결 코드
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    final queryParameters = {
      'user_x': '${position.longitude}',
      'user_y': '${position.latitude}',
    };
    final uri =
        Uri.http('13.124.141.14:8080', '/store/search', queryParameters);
    // final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.get(uri);
    final store = jsonDecode(utf8.decode(response.bodyBytes));
    for (int i = 0; i < store.length; i++) {
      print(store[i]);
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
            getLocation();
          },
          markers: this.widget.mapProvider.myMarkers,
        ),
        this._showBottomSheet
            ? StoreInfoWidget(store: this.widget.mapProvider.selectedStore)
            : Container(),
      ],
    ));
  }
}
