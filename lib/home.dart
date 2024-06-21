import 'package:horizon_time/search.dart';
import 'package:horizon_time/signIn.dart';
import 'package:flutter/material.dart';

var categoryImages = ["assets/images/dress.png","assets/images/sport.png","assets/images/fashion.png" ,"assets/images/diver.png" ];
var categoryName = ["Dress Watches","Sport Watches","Fashion Watches" ,"Diver Watches" ];

var productName = ["Citizen Eco-Drive","Seiko SNK80x","Orient Bambino"];
var productImages = ["assets/images/citizen.png","assets/images/seiko.png","assets/images/orient.png"];
var productPrice = ["300 USD","70 USD","200 USD"];

class home extends StatefulWidget{
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       width: double.infinity,
       height: double.infinity,
       child: SingleChildScrollView(
         child: Column(
           children: [
             Stack(
               alignment: AlignmentDirectional.bottomCenter,
               children: [
                 Container(
                   width: double.infinity,
                   height: 180,
                   color: Colors.grey.shade800,
                 ),
                 Positioned(
                   bottom: 20,
                   child: Container(
                     width: 380,
                     height: 60,
                     child: ElevatedButton(
                       onPressed: (){

                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){

                           return search();
                         }));

                       },
                       style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.black
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Icon(
                             Icons.search,
                             color: Colors.white,
                             size: 30,
                           ),
                           text(text: "Search on Wrist Wears",color: Colors.white,size: 18),
                           Icon(
                             Icons.keyboard_voice_outlined,
                             color: Colors.white,
                             size: 30,
                           )
                         ],
                       ),
                     ),
                   ),
                 ),
                 Positioned(
                   bottom: 80,
                   child: Container(
                     width: 380,
                     height: 80,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             CircleAvatar(backgroundImage: AssetImage("assets/images/logo.png",)),
                             text(text:"  Wrist Wears",color: Colors.blueAccent.shade700,size: 25),
                           ],
                         ),
                         CircleAvatar(
                           backgroundColor: Colors.black,
                           radius: 22,
                           child: Icon(
                             Icons.shopping_cart_outlined,
                             color: Colors.white,
                           ),
                         ),
                       ],
                     ),
                   ),
                 )

               ],
             ),
             SizedBox(
               height: 20,
             ),
             Container(
               width: double.infinity,
               height: 170,
               color: Colors.pinkAccent.shade200,
               child: Column(
                 children: [
                   Text(
                     "Find new watches with 20% off",
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Colors.pink.shade900,
                         fontSize: 30
                     ),

                   ),
                   text(text:"Save your discount. Ends soon",color: Colors.pink.shade900,size: 20),
                   SizedBox(height: 20,),
                   Container(
                     height: 60,
                     child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.pink.shade900
                         ),
                         onPressed: (){}, child: text(text: "Get the coupon",color: Colors.pinkAccent.shade200,size: 25)),
                   )
                 ],
               ),
             ),
             SizedBox(
               height: 50,
             ),
             text(text: "Shop by categories",size: 32),
             Container(
               width: double.infinity,
               height: 500,
               child: Padding(
                 padding: const EdgeInsets.all(10),
                 child: GridView.builder(
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                   itemCount: categoryImages.length,
                   itemBuilder: (context, index) {
                     return Column(
                       children: [
                         CircleAvatar(
                             radius: 80,
                             backgroundImage: AssetImage(categoryImages[index])
                         ),
                         SizedBox(height: 8,),
                         text(text: categoryName[index],size: 22, )
                       ],
                     );
                   },
                 ),
               ),
             ),

             SizedBox(
               height: 30,
             ),

             text(text: "Today's deals - with free shipping",size: 32, ),

             SizedBox(
               height: 20,
             ),

             Container(
               width: double.infinity,
               height: 240,
               child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: productName.length,
                   itemBuilder: (context,index){
                     return Container(
                       width: 200,
                       padding: EdgeInsets.all(10),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                               width: 200,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(15),
                               ),child: Image.asset(productImages[index])),
                           text(text: productName[index],size: 18),
                           Text(
                             "\$" + productPrice[index],
                             style: TextStyle(
                               fontSize: 18,
                               fontWeight: FontWeight.bold,

                             ),
                           )
                         ],
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                       ),
                     );
                   }),
             )

           ],
         ),
       ),
     ),
   );
  }
}

