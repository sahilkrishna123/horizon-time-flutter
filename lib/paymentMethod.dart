import 'package:horizon_time/signIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var titleText = [ "Debit or Credit Card", "NayaPay","Bank Transfer", "Cash On Delivery"];
var imageList = [ "assets/images/debitCard.png","assets/images/paypal.png","assets/images/bank.png","assets/images/COD.png"];

class paymentMethod extends StatefulWidget{
  @override
  State<paymentMethod> createState() => _paymentMethodState();
}

class _paymentMethodState extends State<paymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            ListTile(
              leading: InkWell(
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              title:  text(text: "Choose Payment Method",size: 25)
            ),
            Container(
              width: double.infinity,
              height: 600,
              child: ListView.builder(
                  itemCount: imageList.length,
                  itemBuilder: (context,index){
                return ListTile(
                  minVerticalPadding: 20,
                  leading: Image.asset(imageList[index],
                  height: 35,width: 35,),
                  title: Text(
                    titleText[index],
                  ),
                );
              }),
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              width: 380,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(5)
              ),
              child: button(text: "Add Payment Method", onTap: () => print("add payment method pressed"))

            ),

          ],
        ),
      ),
    );
  }
}