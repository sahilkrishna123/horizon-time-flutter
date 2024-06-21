import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class notifications extends StatefulWidget{
  @override
  State<notifications> createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[600],
      ),
      body: Container(
        width: 200,
        height: 200,
        child: Text(
            "This is notifications"
        ),
        color: Colors.pink,
      ),
    );
  }
}