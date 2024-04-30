import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter/Login_page.dart';
import 'package:first_flutter/main.dart';
import 'package:flutter/material.dart';

class Wrapper_class extends StatefulWidget{
  const Wrapper_class({super.key});

  @override
  State<Wrapper_class> createState() => _Wrapper_classState();
}

class _Wrapper_classState extends State<Wrapper_class> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: StreamBuilder(
         stream:FirebaseAuth.instance.authStateChanges() ,
         builder: (context,snapshot){
           if(snapshot.hasData){
             return MyHomePage();
           }else{
             return const Login_page();
           }
         }),
   );
  }
}