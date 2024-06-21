import 'package:horizon_time/signIn.dart';
import 'package:flutter/material.dart';

class signUp extends StatefulWidget{
  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
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
              Image.asset("assets/images/logo.png",
                height: 100,
                width: 100,),
              RichText(
                  text: TextSpan(
                      text: "Welcome to Wrist Wears",
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 27
                      ),
                      children: [
                        TextSpan(
                            text: " \n     Let's make you account",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 23
                            )
                        )
                      ]
                  )

              ),
              SizedBox(
                height: 15,
              ),
               textField(text: "Name"),
              textField(text: "Your Email / Phone number"),
              textField(text: "Password"),
              textField(text: "Confirm Password"),
              SizedBox(
                height: 15,
              ),
              button(text: "Sign Up", onTap: () => print("sign up pressed")),
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
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold
                    ),
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
              text(text: "Login using",size: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: (){},
                      child: Image.asset("assets/images/apple.png",height: 50,width: 50,)),
                  InkWell(
                      onTap: (){},
                      child: Image.asset("assets/images/facebook.png",height: 50,width: 50,)),
                  InkWell(
                      onTap: (){},
                      child: Image.asset("assets/images/google.png",height: 50,width: 50,))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 text(text: "Already have an account",color: Colors.grey,size: 15),
                  InkWell(

                    onTap: (){

                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
                        return signIn();
                      }));

                    },

                    child: text(text: "Login",color: Colors.blueAccent.shade700,size: 15),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        )
    );
  }
}