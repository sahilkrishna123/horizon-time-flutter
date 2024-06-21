import 'package:horizon_time/signIn.dart';
import 'package:horizon_time/verification.dart';
import 'package:flutter/material.dart';


class forgotPassword extends StatefulWidget{
  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              Image.asset("assets/images/logo.png",
                height: 100,
                width: 100,),
               SizedBox(
                 height: 30,
               ),
               text(text: "Forgot Password",color: Colors.blueAccent.shade700,size: 27),
              Container(
                width: 380,
                height: 50,
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "*",
                        style: TextStyle(
                          color: Colors.deepOrange[900],
                          fontSize: 20
                        ),
                      ),
                      text(text: "We will send you a massage to set or \n            reset"
                          " the new password",color: Colors.grey.shade600,size: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
             textField(text: "Your Email / Phone number"),
              button(text: "Send Verification", onTap: () {

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return verification();
                }));

              }),
              SizedBox(
                height: 200,
              )
            ],
          ),
        )
    );
  }
}