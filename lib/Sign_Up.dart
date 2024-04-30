import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter/Wrapper_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  bool _isValid = false;
  String _errorMessage = '';

  signUp() async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email.text, password: Password.text);
    Get.offAll(const Wrapper_class());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bck2.jpg'),
              fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body:
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 110),
              child: const Text('Create\nAccount',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
            ),

            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery
                    .of(context)
                    .size
                    .height * 0.4, right: 35, left: 35),
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
                    const SizedBox(height: 30),
                    TextField(
                      controller: Password,
                      decoration: InputDecoration(
                          fillColor: Colors.blue.shade50,
                          filled: true,
                          hintText: ('Enter Your Password'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Sign Up', style: TextStyle(fontSize: 27,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black87,
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                _isValid = _validatePassword(Password.text);
                                signUp();
                              });
                            },
                            icon: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                    _isValid
                        ? const Text(
                      'Password is valid!',
                      style: TextStyle(color: Colors.green),
                    )
                        : Text(
                      'Password is not valid!\n'
                          '• $_errorMessage',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validatePassword(String password) {
    // Reset error message
    _errorMessage = '';

    // Password length greater than 6
    if (password.length < 6) {
      _errorMessage += 'Password must be longer than 6 characters.\n';
    }
    return _errorMessage.isEmpty;
  }
}
