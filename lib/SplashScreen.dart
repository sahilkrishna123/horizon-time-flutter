import 'dart:async';

import 'package:horizon_time/gnav.dart';
import 'package:horizon_time/signIn.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final String imageUrl;
  final Color backgroundColor;
  final int duration;

  const SplashScreen({
    Key? key,
    required this.imageUrl,
    this.backgroundColor = Colors.white,
    this.duration = 1000, // 3 seconds
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: widget.duration),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => signIn())));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.imageUrl,
              fit: BoxFit.contain,
              width: 200,
              height: 200, // Adjust as needed
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Wrist Wears",
              style: TextStyle(
                  color: Colors.blueAccent.shade700,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
