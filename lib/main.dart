import 'package:flutter/material.dart';
import 'package:m_box/Login_page.dart';
import 'package:m_box/Signedup_page.dart';
import 'package:m_box/SplashScreen.dart';
import 'package:m_box/car_repair_home.dart';
import 'package:m_box/constants.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen()
    );
  }
}
