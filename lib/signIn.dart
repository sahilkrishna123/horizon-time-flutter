import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgotPassword.dart';
import 'gnav.dart';
import 'signup.dart';

Widget text({required String text, Color? color, double? size}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: size),
  );
}

Widget textField({required String text, TextEditingController? controller}) {
  return Container(
    height: 80,
    width: 380,
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blueAccent.shade700),
        ),
        labelText: text,
        prefixIcon: Icon(Icons.account_circle),
      ),
      style: TextStyle(color: Colors.grey[600], fontSize: 18),
    ),
  );
}

class button extends StatelessWidget {
  final String text; // Required argument for button text
  final VoidCallback onTap; // Function to be executed on tap

  const button({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
        onPressed: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class signIn extends StatefulWidget {
  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      Navigator.pushReplacementNamed(context, '/gnav');
    } on FirebaseAuthException catch (e) {
      String message = "An error occurred. Please try again.";
      if (e.code == 'user-not-found') {
        message = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        message = "Wrong password provided.";
      }

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login Error"),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Ok"))
              ],
            );
          });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              "assets/images/logo.png",
              height: 100,
              width: 100,
            ),
            RichText(
                text: TextSpan(
                    text: "Welcome back to Wrist Wears",
                    style: TextStyle(color: Colors.blue[900], fontSize: 27),
                    children: [
                  TextSpan(
                      text: " \n                sign in to continue",
                      style: TextStyle(color: Colors.grey[600], fontSize: 23))
                ])),
            SizedBox(
              height: 15,
            ),
            textField(
                text: "Your email / phone number",
                controller: emailController
                
                ),
            textField(text: "Password", controller: passwordController),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                text(
                    text: "Remember me",
                    color: Colors.grey.shade600,
                    size: 18),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return forgotPassword();
                    }));
                  },
                  child: text(
                      text: "Forgot Password",
                      color: Colors.blueAccent.shade700,
                      size: 18),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            _isLoading
                ? CircularProgressIndicator()
                : button(text: "Login In", onTap: _login),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 1,
                  width: 150,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1,
                  width: 150,
                  child: Container(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            text(text: "login using", size: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/apple.png",
                      height: 50,
                      width: 50,
                    )),
                InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/facebook.png",
                      height: 50,
                      width: 50,
                    )),
                InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/google.png",
                      height: 50,
                      width: 50,
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(
                    text: "Don't have any account",
                    color: Colors.grey,
                    size: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return signUp();
                    }));
                  },
                  child: text(
                      text: "Register",
                      color: Colors.blueAccent.shade700,
                      size: 15),
                )
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'forgotPassword.dart';
// import 'gnav.dart';
// import 'signup.dart';

// Widget text({required String text, Color? color, double? size}) {
//   return Text(
//     text,
//     style: TextStyle(color: color, fontSize: size),
//   );
// }

// Widget textField({required String text, TextEditingController? controller}) {
//   return Container(
//     height: 80,
//     width: 380,
//     child: TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.blueAccent.shade700),
//         ),
//         labelText: text,
//         prefixIcon: Icon(Icons.account_circle),
//       ),
//       style: TextStyle(color: Colors.grey[600], fontSize: 18),
//     ),
//   );
// }

// class button extends StatelessWidget {
//   final String text; // Required argument for button text
//   final VoidCallback onTap; // Function to be executed on tap

//   const button({
//     Key? key,
//     required this.text,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 380,
//       height: 60,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
//         onPressed: onTap,
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//       ),
//     );
//   }
// }

// TextEditingController emailController = TextEditingController();
// TextEditingController passwordController = TextEditingController();

// class signIn extends StatefulWidget {
//   @override
//   State<signIn> createState() => _signInState();
// }

// class _signInState extends State<signIn> {
//   bool _isLoading = false;

//   Future<void> _login() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//               email: emailController.text.trim(),
//               password: passwordController.text.trim());

//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//         return gnav();
//       }));
//     } on FirebaseAuthException catch (e) {
//       String message = "An error occurred. Please try again.";
//       if (e.code == 'user-not-found') {
//         message = "No user found for that email.";
//       } else if (e.code == 'wrong-password') {
//         message = "Wrong password provided.";
//       }

//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text("Login Error"),
//               content: Text(message),
//               actions: [
//                 TextButton(
//                     onPressed: () => Navigator.of(context).pop(),
//                     child: Text("Ok"))
//               ],
//             );
//           });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             Image.asset(
//               "assets/images/logo.png",
//               height: 100,
//               width: 100,
//             ),
//             RichText(
//                 text: TextSpan(
//                     text: "Welcome back to Wrist Wears",
//                     style: TextStyle(color: Colors.blue[900], fontSize: 27),
//                     children: [
//                   TextSpan(
//                       text: " \n                sign in to continue",
//                       style: TextStyle(color: Colors.grey[600], fontSize: 23))
//                 ])),
//             SizedBox(
//               height: 15,
//             ),
//             textField(
//                 text: "Your email / phone number",
//                 controller: emailController),
//             textField(text: "Password", controller: passwordController),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 text(
//                     text: "Remember me",
//                     color: Colors.grey.shade600,
//                     size: 18),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) {
//                       return forgotPassword();
//                     }));
//                   },
//                   child: text(
//                       text: "Forgot Password",
//                       color: Colors.blueAccent.shade700,
//                       size: 18),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             _isLoading
//                 ? CircularProgressIndicator()
//                 : button(text: "Login In", onTap: _login),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(
//                   height: 1,
//                   width: 150,
//                   child: Container(
//                     color: Colors.grey,
//                   ),
//                 ),
//                 Text(
//                   "OR",
//                   style: TextStyle(
//                       color: Colors.grey[600], fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 1,
//                   width: 150,
//                   child: Container(
//                     color: Colors.grey,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             text(text: "login using", size: 18),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                     onTap: () {},
//                     child: Image.asset(
//                       "assets/images/apple.png",
//                       height: 50,
//                       width: 50,
//                     )),
//                 InkWell(
//                     onTap: () {},
//                     child: Image.asset(
//                       "assets/images/facebook.png",
//                       height: 50,
//                       width: 50,
//                     )),
//                 InkWell(
//                     onTap: () {},
//                     child: Image.asset(
//                       "assets/images/google.png",
//                       height: 50,
//                       width: 50,
//                     ))
//               ],
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 text(
//                     text: "Don't have any account",
//                     color: Colors.grey,
//                     size: 15),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) {
//                       return signUp();
//                     }));
//                   },
//                   child: text(
//                       text: "Register",
//                       color: Colors.blueAccent.shade700,
//                       size: 15),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }














// import 'package:horizon_time/forgotPassword.dart';
// import 'package:horizon_time/gnav.dart';
// import 'package:horizon_time/signup.dart';
// import 'package:flutter/material.dart';

// Widget text({required String text,Color? color, double? size}) {

//   return Text(text,style: TextStyle(
//       color: color,
//       fontSize: size
//   ),);

// }


// Widget textField ({required String text,TextEditingController? controller}) {
//   return   Container(
//     height: 80,
//     width: 380,
//     child: TextField(
//       controller: controller,
//       decoration: InputDecoration(

//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//                 color: Colors.grey.shade600,
//                 width: 2
//             )
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(
//               color: Colors.blueAccent.shade700
//           ),
//         ),

//         labelText: text,
//         prefixIcon: Icon(
//             Icons.account_circle
//         ),
//       ),
//       style: TextStyle(
//           color: Colors.grey[600],
//           fontSize: 18
//       ),
//     ),
//   );

// }


// class button extends StatelessWidget {
//   final String text; // Required argument for button text
//   final VoidCallback onTap; // Function to be executed on tap// Optional argument for an icon

//   const button({
//     Key? key,
//     required this.text,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 380,
//       height: 60,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue[900]
//         ),
//         onPressed: onTap,
//         child:  Center(
//             child: Text(text,style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20
//             ),)
//         ),
//       ),
//     );
//   }
// }
// var email = "sahil123@gmail.com" ;
// var password = "sahil123" ;
// TextEditingController emailController = TextEditingController() ;
// TextEditingController passwordController = TextEditingController() ;


// class signIn extends StatefulWidget{


//   @override
//   State<signIn> createState() => _signInState();
// }

// class _signInState extends State<signIn> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             Image.asset("assets/images/logo.png",
//             height: 100,
//             width: 100,),
//             RichText(
//                text: TextSpan(
//                  text: "Welcome back to Wrist Wears",
//                  style: TextStyle(
//                    color: Colors.blue[900],
//                    fontSize: 27
//                  ),
//                  children: [
//                    TextSpan(
//                      text: " \n                sign in to continue",
//                      style: TextStyle(
//                        color: Colors.grey[600],
//                        fontSize: 23
//                      )
//                    )
//                  ]
//                )

//             ),
//             SizedBox(
//               height: 15,
//             ),
//             textField(text: "Your email / phone number",controller: emailController),
//             textField(text: "Password",controller: passwordController),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 text(text: "Remember me", color: Colors.grey.shade600, size: 18),
//                 InkWell(

//                     onTap: (){

//                       Navigator.push(context, MaterialPageRoute(builder: (context){
//                         return forgotPassword();
//                       }));

//                     },

//                     child: text(text: "Forgot Password", color: Colors.blueAccent.shade700, size: 18),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             button(text: "Login In", onTap: (){
//               if(emailController.text.toString()=="sahil123@gmail.com" && passwordController.text.toString()=="sahil123"){
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
//                   return gnav();
//                 }));
//               }
//               else {
//                showDialog(context: context, builder:(BuildContext context){
//                  return  AlertDialog(
//                    title: Text(
//                        "Login Error"
//                    ),
//                    content: Text(
//                        "Invalid Email or Password"
//                    ),
//                    actions: [
//                      TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("Ok"))
//                    ],
//                  );
//                });
//               }
//             }),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(
//                   height: 1,
//                   width: 150,
//                   child: Container(
//                     color: Colors.grey,
//                   ),
//                 ),
//                 Text(
//                   "OR",
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontWeight: FontWeight.bold
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1,
//                   width: 150,
//                   child: Container(
//                     color: Colors.grey,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 15,
//             ),
//            text(text: "login using",size: 18),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                     onTap: (){},
//                     child: Image.asset("assets/images/apple.png",height: 50,width: 50,)),
//                 InkWell(
//                     onTap: (){},
//                     child: Image.asset("assets/images/facebook.png",height: 50,width: 50,)),
//                 InkWell(
//                     onTap: (){},
//                     child: Image.asset("assets/images/google.png",height: 50,width: 50,))
//               ],
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 text(text: "Don't have any account",color: Colors.grey,size: 15),
//                 InkWell(

//                   onTap: (){

//                     Navigator.push(context, MaterialPageRoute(builder: (context) {
//                       return signUp();
//                     }));

//                   },

//                   child: text(text: "Register",color: Colors.blueAccent.shade700,size: 15),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             )
//           ],
//         ),
//       )
//     );
//   }
// }

