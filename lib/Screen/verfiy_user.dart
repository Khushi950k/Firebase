import 'package:firebase/Screen/otp_screen.dart';
import 'package:firebase/Widgets/uihelper.dart';
import 'package:flutter/material.dart';
class VerfiyUser extends StatefulWidget {
  const VerfiyUser({Key? key}) : super(key: key);

  @override
  State<VerfiyUser> createState() => _VerfiyUserState();
}

class _VerfiyUserState extends State<VerfiyUser> {
  TextEditingController phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verfiy User", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomTextField(phonecontroller, "Enter Phone Number", Icons.phone, false),

            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen()));
            }, child: Text("Verfiy", style:TextStyle(color: Colors.white),),
              style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.blue),
              ),
            ),
          ]
      ),
    );
  }
}
