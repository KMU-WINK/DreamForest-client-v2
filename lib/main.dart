import 'dart:io';

import 'package:flutter/material.dart';
import 'map_provider_1.dart';
import './main_page.dart';
// import 'package:naver_map/views/android_main.dart';
import 'package:provider/provider.dart';

void main() => runApp(NaverMap());

class NaverMap extends StatelessWidget {
  const NaverMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MapProvider>(create: (_) => MapProvider())
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapProvider _mapProvider = Provider.of<MapProvider>(context);

    return Main_Page(
      mapProvider: _mapProvider,
    );
  }
}
