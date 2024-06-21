import 'package:horizon_time/newPassword.dart';
import 'package:horizon_time/signIn.dart';
import 'package:flutter/material.dart';

class verification extends StatefulWidget{
  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {
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
                height: 200,
              ),
              text(text: "Enter Verification code",size: 27,color: Colors.blueAccent.shade700),
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
                          " the new password",color: Colors.grey.shade600,size: 20)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
               textField(text: "Enter OTP here"),
               button(text: "Confirm", onTap: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                   return newPassword();
                 }));
               }),
              SizedBox(
                height: 300,
              )
            ],
          ),
        )
    );
  }
}