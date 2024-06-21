import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class deliveryAddress extends StatefulWidget{
  @override
  State<deliveryAddress> createState() => _deliveryAddressState();
}

class _deliveryAddressState extends State<deliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        height: 200,
        child: Text(
            "This is deliveryAddress"
        ),
        color: Colors.red,
      ),
    );
  }
}