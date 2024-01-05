import 'package:firebase/Widgets/uihelper.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
     body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          UiHelper.CustomTextField(emailcontroller, "Enter Email", Icons.email, false),

      SizedBox(height: 10,),
      ElevatedButton(onPressed: (){

      }, child: Text("OTP", style:TextStyle(color: Colors.white),),
        style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.blue),
        ),
      ),
    ]
     )
    );
  }
}
