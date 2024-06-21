import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class about extends StatefulWidget{
  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        height: 200,
        child: Text(
            "This is about"
        ),
        color: Colors.blueGrey,
      ),
    );
  }
}