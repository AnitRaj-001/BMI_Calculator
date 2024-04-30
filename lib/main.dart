import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_flutter/Splash_Screen.dart';
import 'package:first_flutter/Wrapper_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Future.delayed(const Duration(seconds: 3));
  // FlutterNativeSplash.remove();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Wrapper_class(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = " ";

  SignOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/bck2.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                        fillColor: Colors.blue.shade50,
                        filled: true,
                        hintText: 'Enter Your Weight Here',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.line_weight_outlined)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        fillColor: Colors.blue.shade50,
                        filled: true,
                        hintText: 'Enter Your Height in cm',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.height_outlined)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: inchController,
                    decoration: InputDecoration(
                        fillColor: Colors.blue.shade50,
                        filled: true,
                        hintText: 'Enter Your Height in inch',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.height_outlined)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inchController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iinc = int.parse(inch);

                        var Tinch = (ift * 12) + iinc;

                        var Tcm = Tinch * 2.54;
                        var Tm = Tcm / 100;
                        var Bmi = iwt / (Tm * Tm);

                        setState(() {
                          result = 'Your BMI is ${Bmi.toStringAsFixed(2)}';
                        });
                      } else {
                        setState(() {
                          result = "Please fill the All blanks!!";
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54,
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    child: const Text('Calculate',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    result,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Logout',style: TextStyle(fontSize: 27,color: Colors.black87,fontWeight: FontWeight.bold),),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.black87,
                        child: IconButton(
                          color: Colors.white,
                          onPressed:(() => SignOut()) ,
                          icon:const Icon(Icons.logout_rounded),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
