import 'dart:async';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:first_flutter/Wrapper_class.dart';
import 'package:flutter/material.dart';


class Splash_Screen extends StatefulWidget{
  @override
  State<Splash_Screen> createState() => Splash_ScreenState();
}

class Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    whereToGo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.grey,
        child: const Center(child: Text('BMI',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white),)),
      ) ,
    );
  }
  void whereToGo() async{
    Timer(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Wrapper_class()));
    });


  }
}

