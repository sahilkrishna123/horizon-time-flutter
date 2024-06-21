import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:horizon_time/gnav.dart';
import 'package:horizon_time/signIn.dart';

var iconList1 = [Icons.female, Icons.email, Icons.phone_android, Icons.lock];
var titleTextList = ["Gender", "Email", "Phone Number", "Password"];
var subtitleTextList = [
  "female",
  "sahil123@gmail.com",
  "03137347110",
  "......"
];
var textList = [
  "About",
  "Privacy Policy",
  "Terms and Conditions",
  "Send Feedback"
];

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => signIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            ListTile(
              leading: InkWell(
                child: Icon(Icons.arrow_back_ios),
                onTap: () {
                  setState(() {
                    varindex = 0;
                  });
                },
              ),
              title: text(text: "Your Account", size: 25),
            ),
            SizedBox(
              height: 40,
            ),
            ListTile(
              title: text(text: "Sahil Krishna", size: 22),
              isThreeLine: true,
              subtitle:
                  text(text: "sahil123@gmail.com", color: Colors.grey.shade600),
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: ListView.builder(
                itemCount: titleTextList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    minVerticalPadding: 10,
                    leading: Icon(iconList1[index]),
                    title: text(text: titleTextList[index]),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    isThreeLine: true,
                    subtitle: text(
                      text: subtitleTextList[index],
                      color: Colors.grey.shade600,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 1,
              child: Container(
                color: Colors.grey,
              ),
            ),
            Container(
              width: double.infinity,
              height: 270,
              child: ListView.builder(
                itemCount: textList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    minVerticalPadding: 10,
                    title: text(
                      text: textList[index],
                      color: Colors.blueAccent.shade700,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logout,
              child: Text("Logout"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.blueAccent.shade700),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget text({required String text, Color? color, double? size}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: size),
  );
}











// import 'package:horizon_time/gnav.dart';
// import 'package:horizon_time/signIn.dart';
// import 'package:horizon_time/gnav.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// var iconList1 = [Icons.female,Icons.email,Icons.phone_android,Icons.lock];
// var titleTextList = [ "Gender", "Emial","Phone Number","Password"];
// var subtitleTextList = [ "female", "sahil123@gmail.com", "03137347110","......"];
// var textList = [ "About","Privacy Policy","Terms and Conditions","Send Feedback"];

// class profile extends StatefulWidget{
//   @override
//   State<profile> createState() => _profileState();
// }

// class _profileState extends State<profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 80,
//           ),
//           ListTile(
//               leading: InkWell(
//                 child: Icon(
//                     Icons.arrow_back_ios,
//                 ),
//                 onTap: (){

//                   setState(() {
//                     varindex = 0 ;
//                   });

//                 },
//               ),
//               title: text(text: "Your Account",size: 25)
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           ListTile(
//               title: text(text: "Sahil Krishna" ,size: 22),
//               isThreeLine: true,
//               subtitle: text(text: "sahil123@gmail.com",color: Colors.grey.shade600)
//           ),
//           Container(
//             width: double.infinity,
//             height: 300,
//             child: ListView.builder(
//               itemCount: titleTextList.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   minVerticalPadding: 10,
//                   leading: Icon(
//                     iconList1[index],

//                   ),
//                   title: text(
//                       text: titleTextList[index],

//                   ),
//                   trailing: Icon(
//                     Icons.arrow_forward_ios_rounded,

//                   ),
//                   isThreeLine: true,
//                   subtitle: text(
//                       text: subtitleTextList[index],
//                       color: Colors.grey.shade600
//                   ),
//                 );
//               },),
//           ),
//           SizedBox(
//             height: 1,
//             child: Container(
//               color: Colors.grey,
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             height: 270,
//             child: ListView.builder(
//                 itemCount: textList.length,
//                 itemBuilder: (context,index){
//                   return ListTile(
//                     minVerticalPadding: 10,
//                     title: text(
//                         text: textList[index],
//                         color: Colors.blueAccent.shade700
//                     ),
//                   );
//                 }),
//           )
//         ],
//       )
//     );
//   }
// }