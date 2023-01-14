import 'package:dreamforest/mainscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      title: 'Dream Forest',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
    );
    // title: 'Flutter Demo',
    // theme: ThemeData(
    //   primaryColor: Colors.white,
    //   primarySwatch: Colors.blue,
    //   visualDensity: VisualDensity.adaptivePlatformDensity,
    // ),
  }
}
