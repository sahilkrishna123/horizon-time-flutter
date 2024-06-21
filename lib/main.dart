import 'package:horizon_time/SplashScreen.dart';
import 'package:horizon_time/forgotPassword.dart';
import 'package:horizon_time/gnav.dart';
import 'package:horizon_time/home.dart';
import 'package:horizon_time/notifications.dart';
import 'package:horizon_time/signIn.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(
      ),
      home: SplashScreen(imageUrl: "assets/images/logo.png",),
    );
  }
}