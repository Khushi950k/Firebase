import 'package:firebase/Widgets/uihelper.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

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
            ElevatedButton(onPressed: (){

            }, child: Text("OTP", style:TextStyle(color: Colors.white),),
              style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.blue),
              ),
            ),
          ]
      ),
    );
  }
}
