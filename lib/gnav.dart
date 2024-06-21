import 'package:horizon_time/favorite.dart';
import 'package:horizon_time/home.dart';
import 'package:horizon_time/profile.dart';
import 'package:horizon_time/search.dart';
import 'package:google_nav_bar/google_nav_bar.dart' ;
import 'package:flutter/material.dart';

var tab = [home(), favorite(), search(), profile()] ;
var varindex = 0 ;

class gnav extends StatefulWidget{
  @override
  State<gnav> createState() => _gnavState();
}

class _gnavState extends State<gnav> {


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: tab[varindex],
     bottomNavigationBar: Container(
       color: Colors.grey.shade900,
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
         child: GNav(
           backgroundColor: Colors.grey.shade900,
           color: Colors.white,
           activeColor: Colors.blueAccent.shade700,
           tabBackgroundColor: Color(0xFF33333),
           gap: 8,
           padding: EdgeInsets.all(16),
           onTabChange: (index){
             varindex = index ;
             setState(() {

             });
           },
           tabs: [
             GButton(icon: Icons.home_outlined,text: "Home",),
             GButton(icon: Icons.favorite_border,text: "Favorite",),
             GButton(icon: Icons.search, text: "Search"),
             GButton(icon: Icons.account_circle_outlined,text: "Profile",)
           ],
         ),
       ),
     ) ,

   );
  }
}