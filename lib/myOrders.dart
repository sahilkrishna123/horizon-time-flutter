import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myOrders extends StatefulWidget{
  @override
  State<myOrders> createState() => _myOrdersState();
}

class _myOrdersState extends State<myOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        height: 200,
        child: Text(
          "This is myOrders"
        ),
        color: Colors.yellow,
      ),
    );
  }
}