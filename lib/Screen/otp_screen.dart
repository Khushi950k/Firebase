import 'dart:developer';

import 'package:firebase/Screen/HomeScreen.dart';
import 'package:firebase/Widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  String verficationid;
   OTPScreen({Key? key,required this.verficationid}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Screen", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomTextField(otpcontroller, "Enter OTP", Icons.phone, false),

            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()async{
              try{
                PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verficationid, smsCode: otpcontroller.text.toString());
                await FirebaseAuth.instance.signInWithCredential(credential).then((value){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
                });
              }
              catch(ex){
                log(ex.toString());
              }

            }, child: Text("OTP", style:TextStyle(color: Colors.white),),
              style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.blue),
              ),
            ),
          ]
      ),
    );
  }
}
