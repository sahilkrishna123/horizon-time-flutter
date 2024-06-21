import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class help extends StatefulWidget{
  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        height: 200,
        child: Text(
            "This is help"
        ),
        color: Colors.deepPurple,
      ),
    );
  }
}