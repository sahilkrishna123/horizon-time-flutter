import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class wishlist extends StatefulWidget{
  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 200,
        height: 200,
        child: Text(
            "This is wishlist"
        ),
        color: Colors.blue,
      ),
    );
  }
}