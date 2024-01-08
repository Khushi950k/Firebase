import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Screen/signin_screen.dart';
import 'package:firebase/Widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  SignUp(String email,String password)async{
    if(email=="" && password==""){
      return log("Enter Required Field's");
    }
    else{
      UserCredential? userCredential;
      try{
        userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
          log("User Created");
        }).then((value){
          FirebaseFirestore.instance.collection("Users").doc(email).set({
            "Email":email
          });
        }).then((value){
          log("Data Instered");
        });
      }
      on FirebaseAuthException catch(ex){
        log(ex.code.toString());
      }

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailcontroller, "Enter Email", Icons.email, false),
          UiHelper.CustomTextField(passwordcontroller, "Enter password", Icons.password, true),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            SignUp(emailcontroller.text.toString(), passwordcontroller.text.toString());
          }, child: Text("Sign Up", style:TextStyle(color: Colors.white),),
          style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.blue),
          ),
          ),
          SizedBox(height: 15),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
          }, child: Text("Sign In",style:TextStyle(color: Colors.white)),
            style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.blue),
            ),)
        ],
      ),
    );
  }
}
