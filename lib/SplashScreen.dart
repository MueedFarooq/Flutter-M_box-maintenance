import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:m_box/Login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Buyer.dart';
import 'Seller.dart';
import 'car_repair_home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      Islogin();
  }

  void Islogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool('islogin') ?? false;
    String selectedItem = sp.getString('Role') ?? '';
    (islogin) ? Timer(Duration(seconds: 5), () {
      if(selectedItem == 'Repair') {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CarRepairHome()));
      }else if (selectedItem == 'Seller'){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Seller()));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Buyer()));
      }
    }):
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 270,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.orange.shade600,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              SizedBox(width: 20,),
              Text('ZERO',style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade100,
              ),),
              SizedBox(width: 20,height: 100,),
              DefaultTextStyle(
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
                child: AnimatedTextKit(
                    onTap: (){},
                    stopPauseOnTap: true,
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText('IS'),
                      RotateAnimatedText('THE'),
                      RotateAnimatedText('BEST'),
                    ]
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
