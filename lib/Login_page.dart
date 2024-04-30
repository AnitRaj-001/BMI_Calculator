import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ForgetPass.dart';
import 'Sign_Up.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<StatefulWidget> createState() {
    return Login();
  }
}

class Login extends State<Login_page> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();

  SignIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: Email.text, password: Password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bck1.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:
             Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 35,top: 150),
                    child: const Text('Welcome\nhere',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 35),),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,right: 35,left: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: Email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              fillColor: Colors.blue.shade50,
                              filled: true,
                              hintText: ('Enter Your Email'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextField(
                            controller: Password,
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.blue.shade50,
                              filled: true,
                              hintText: ('Enter Your Password'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Sign In',style: TextStyle(fontSize: 27,color: Colors.black87,fontWeight: FontWeight.bold),),
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.black87,
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed:(() => SignIn()) ,
                                  icon:const Icon(Icons.arrow_forward_ios),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(onPressed: (() => Get.to(SignUp())), child: const Text('Sign Up',style: TextStyle(decoration: TextDecoration.underline,fontSize: 20,
                              color: Colors.black87))),
                              TextButton(onPressed: (() => Get.to(ForgetPass())), child: const Text('Forgot Password',style: TextStyle(decoration: TextDecoration.underline,fontSize: 20,
                                  color: Colors.black87))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
