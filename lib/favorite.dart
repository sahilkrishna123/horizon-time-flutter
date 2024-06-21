import 'package:horizon_time/SplashScreen.dart';
import 'package:horizon_time/about.dart';
import 'package:horizon_time/deliveryAddress.dart';
import 'package:horizon_time/favorite.dart';
import 'package:horizon_time/help.dart';
import 'package:horizon_time/myOrders.dart';
import 'package:horizon_time/notifications.dart';
import 'package:horizon_time/offers.dart';
import 'package:horizon_time/paymentMethod.dart';
import 'package:horizon_time/signIn.dart';
import 'package:horizon_time/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


var iconList = [Icons.shopping_bag,Icons.favorite,Icons.home,Icons.payment,Icons.local_offer,Icons.notifications,Icons.help,Icons.info];
var textList = [ "My Orders", "Wishlist", "Delivery Address", "Payment Methods", "Offers", "Notifications", "Help", "About"];
var widgetList = [myOrders(),wishlist(),deliveryAddress(),paymentMethod(),offers(),notifications(),help(),about()];


class favorite extends StatefulWidget{
  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          ListTile(
              title: Text(
                "Sahil Krishna",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              isThreeLine: true,
              subtitle: text(text: "sahil123@gmail.com",color: Colors.grey.shade600)
          ),
          SizedBox(
            height: 20,
          ),

          Container(
            width: double.infinity,
            height: 550,
            child: ListView.builder(
                itemCount: iconList.length,

                itemBuilder: (context,int index){

                  return ListTile(

                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return widgetList[index] ;
                      }));
                    },

                    minVerticalPadding: 20,
                    leading: Icon(
                      iconList[index],
                    ),
                    title: Text(
                        textList[index]
                    ),
                    trailing: Icon(
                        Icons.arrow_forward_ios
                    ),

                  );
                }
            ),
          ),
          
          SizedBox(
            height: 60,
          ),
          Center(
              child: text(text:  "Privacy Policy | Terms and Conditions",color: Colors.grey.shade600)
          )
        ],
      ),
        ),
      
    );
  }
}