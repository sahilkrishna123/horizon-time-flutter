import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class offers extends StatefulWidget{
  @override
  State<offers> createState() => _offersState();
}

class _offersState extends State<offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        height: 200,
        child: Text(
            "This is offers"
        ),
        color: Colors.green,
      ),
    );
  }
}