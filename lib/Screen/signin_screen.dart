import 'package:firebase/Screen/HomeScreen.dart';
import 'package:firebase/Screen/forgotpassword.dart';
import 'package:firebase/Widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    SignIn(String email,String password)async{
      if(email=="" && password==""){
        return log("Enter Required Field's");
      }
      else{
        UserCredential? userCredential;
        try{
          userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          });
        }
        on FirebaseAuthException catch(ex){
          return log(ex.code.toString());
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In", style: TextStyle(color: Colors.white),),
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
            SignIn(emailcontroller.text.toString(), passwordcontroller.text.toString());
          }, child: Text("Sign Up", style:TextStyle(color: Colors.white),),
            style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.blue),
            ),),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
          }, child: Text("Forgot Password", style:TextStyle(color: Colors.white),),
            style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.blue),
            ),),
        ],
      ),
    );
  }
}
