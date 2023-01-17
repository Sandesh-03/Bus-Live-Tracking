import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'homePage.dart';

void main() async{


  var url='https://www.google.com/maps/place/Hadapsar,+Pune,+Maharashtra/@18.497254,73.9394188,14z/data=!3m1!4b1!4m5!3m4!1s0x3bc2e9ff81f1aae9:0x2560343555ac8b53!8m2!3d18.508934!4d73.9259102';

 print(url.split("/")[6].replaceAll("@", "").split(","));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'admin_app',
    home: HomePage(),
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
  ));
}
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//
//   SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//
//   await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//
//   runApp(MyApp(
//     prefs: prefs,
//   ));
// }