import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'signIn.dart'; // Import your signIn screen if needed

class signUp extends StatefulWidget {
  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  // TextEditingController for handling user input
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  // State variable to track loading state
  bool _isLoading = false;

  // Function to handle user registration
  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text.toString(),
              password: _passwordController.text.toString());

      // Display success dialog
      _showSuccessDialog();

      // You can optionally save additional user details to Firestore or other databases here
      // For example, firestoreInstance.collection("users").doc(userCredential.user.uid).set(...)

      // Navigate to signed in screen or any other screen after successful registration
      // For example:
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Function to show success dialog
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Registration Successful"),
          content: Text("You have successfully registered!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to another screen if needed
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              // Your existing UI code
              // ...
              textField(text: "Name", controller: _nameController),
              textField(
                  text: "Your Email / Phone number",
                  controller: _emailController),
              textField(text: "Password", controller: _passwordController),
              textField(
                  text: "Confirm Password",
                  controller: _confirmPasswordController),
              SizedBox(
                height: 15,
              ),
              _isLoading 
                  ? CircularProgressIndicator() 
                  : button(text: "Sign Up", onTap: _register), // Call _register function on button tap
              // Your existing UI code continues...
            ],
          ),
        ),
      ),
    );
  }
}

// Helper widget for text field
Widget textField({required String text, TextEditingController? controller}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: text,
      border: OutlineInputBorder(),
    ),
  );
}

// Helper widget for button
Widget button({required String text, required VoidCallback onTap}) {
  return ElevatedButton(
    onPressed: onTap,
    child: Text(text),
  );
}








// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
// import 'signIn.dart'; // Import your signIn screen if needed

// class signUp extends StatefulWidget {
//   @override
//   State<signUp> createState() => _signUpState();
// }

// class _signUpState extends State<signUp> {
//   // TextEditingController for handling user input
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _confirmPasswordController = TextEditingController();

//   // State variable to track loading state
//   bool _isLoading = false;

//   // Function to handle user registration
//   Future<void> _register() async {
//     setState(() {
//       _isLoading = true;
//     });
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: _emailController.text.toString(),
//               password: _passwordController.text.toString());

//       // You can optionally save additional user details to Firestore or other databases here
//       // For example, firestoreInstance.collection("users").doc(userCredential.user.uid).set(...)

//       // Navigate to signed in screen or any other screen after successful registration
//       // For example:
//       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
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
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               // Your existing UI code
//               // ...
//               textField(text: "Name", controller: _nameController),
//               textField(
//                   text: "Your Email / Phone number",
//                   controller: _emailController),
//               textField(text: "Password", controller: _passwordController),
//               textField(
//                   text: "Confirm Password",
//                   controller: _confirmPasswordController),
//               SizedBox(
//                 height: 15,
//               ),
//               _isLoading 
//                   ? CircularProgressIndicator() 
//                   : button(text: "Sign Up", onTap: _register), // Call _register function on button tap
//               // Your existing UI code continues...
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Helper widget for text field
// Widget textField({required String text, TextEditingController? controller}) {
//   return TextField(
//     controller: controller,
//     decoration: InputDecoration(
//       labelText: text,
//       border: OutlineInputBorder(),
//     ),
//   );
// }

// // Helper widget for button
// Widget button({required String text, required VoidCallback onTap}) {
//   return ElevatedButton(
//     onPressed: onTap,
//     child: Text(text),
//   );
// }







// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
// import 'signIn.dart'; // Import your signIn screen if needed

// class signUp extends StatefulWidget {
//   @override
//   State<signUp> createState() => _signUpState();
// }

// class _signUpState extends State<signUp> {
//   // TextEditingController for handling user input
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _confirmPasswordController = TextEditingController();

//   // Function to handle user registration
//   Future<void> _register() async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: _emailController.text.toString(),
//               password: _passwordController.text.toString());

//       // You can optionally save additional user details to Firestore or other databases here
//       // For example, firestoreInstance.collection("users").doc(userCredential.user.uid).set(...)

//       // Navigate to signed in screen or any other screen after successful registration
//       // For example:
//       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               // Your existing UI code
//               // ...
//               textField(text: "Name", controller: _nameController),
//               textField(
//                   text: "Your Email / Phone number",
//                   controller: _emailController),
//               textField(text: "Password", controller: _passwordController),
//               textField(
//                   text: "Confirm Password",
//                   controller: _confirmPasswordController),
//               SizedBox(
//                 height: 15,
//               ),
//               button(text: "Sign Up", onTap: _register), // Call _register function on button tap
//               // Your existing UI code continues...
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Helper widget for text field
// Widget textField({required String text, TextEditingController? controller}) {
//   return TextField(
//     controller: controller,
//     decoration: InputDecoration(
//       labelText: text,
//       border: OutlineInputBorder(),
//     ),
//   );
// }

// // Helper widget for button
// Widget button({required String text, required VoidCallback onTap}) {
//   return ElevatedButton(
//     onPressed: onTap,
//     child: Text(text),
//   );
// }




// import 'package:horizon_time/signIn.dart';
// import 'package:flutter/material.dart';

// import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth


// class signUp extends StatefulWidget {
//   @override
//   State<signUp> createState() => _signUpState();
// }

// class _signUpState extends State<signUp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       child: SingleChildScrollView(
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
//                     text: "Welcome to Wrist Wears",
//                     style: TextStyle(color: Colors.blue[900], fontSize: 27),
//                     children: [
//                   TextSpan(
//                       text: " \n     Let's make you account",
//                       style: TextStyle(color: Colors.grey[600], fontSize: 23))
//                 ])),
//             SizedBox(
//               height: 15,
//             ),
//             textField(text: "Name"),
//             textField(text: "Your Email / Phone number"),
//             textField(text: "Password"),
//             textField(text: "Confirm Password"),
//             SizedBox(
//               height: 15,
//             ),
//             button(text: "Sign Up", onTap: () => print("sign up pressed")),
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
//             text(text: "Login using", size: 18),
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
//                     text: "Already have an account",
//                     color: Colors.grey,
//                     size: 15),
//                 InkWell(
//                   onTap: () {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) {
//                       return signIn();
//                     }));
//                   },
//                   child: text(
//                       text: "Login",
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
//     ));
//   }
// }
