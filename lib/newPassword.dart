import 'package:horizon_time/signIn.dart';
import 'package:flutter/material.dart';

class newPassword extends StatefulWidget{
  @override
  State<newPassword> createState() => _newPasswordState();
}

class _newPasswordState extends State<newPassword> {
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
              text(text: "New Password",color: Colors.blueAccent.shade700,size: 27),
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
                      text(text: "Set the new Password for your account",color: Colors.grey.shade600,size: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              textField(text: "Password"),
              textField(text: "Confirm Password"),
              button(text: "Set Password", onTap: () => print("Set Password pressed")),
              SizedBox(
                height: 250,
              )
            ],
          ),
        )
    );
  }
}