import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPass extends StatefulWidget {
  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  TextEditingController Email = TextEditingController();

  reset() async {
    FirebaseAuth.instance.sendPasswordResetEmail(email: Email.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bck2.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 150),
              child: const Text(
                'Forgot\n  Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    TextField(
                      controller: Email,
                      decoration: InputDecoration(
                          fillColor: Colors.blue.shade50,
                          filled: true,
                          hintText: ('Enter Your Email'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    SizedBox(height: 40),
                    IconButton(
                        onPressed: (() => reset()), icon: const Icon(Icons.send_sharp,color: Colors.black87,size: 55),
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
