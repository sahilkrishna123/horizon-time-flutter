import 'package:horizon_time/SplashScreen.dart';
import 'package:horizon_time/forgotPassword.dart';
import 'package:horizon_time/gnav.dart';
import 'package:horizon_time/home.dart';
import 'package:horizon_time/notifications.dart';
import 'package:horizon_time/signIn.dart';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAQGgB0UZc7MrCVAItQsMmSTzPde1yEMNs",
          authDomain: "horizon-time.firebaseapp.com",
          projectId: "horizon-time",
          storageBucket: "horizon-time.appspot.com",
          messagingSenderId: "487795975156",
          appId: "1:487795975156:web:b48a3c9e61ea9a3efc8fa1",
          measurementId: "G-01WMRZXLXQ"),
    );
    print('Firebase successfully connected');
  } catch (e) {
    print('Error connecting to Firebase: $e');
  }
  runApp(MyApp());
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