import 'package:firebase/Screen/otp_screen.dart';
import 'package:firebase/Widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            ElevatedButton(onPressed: ()async{
              await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential phoneauthcredential){},
                  verificationFailed: (FirebaseAuthException ex){},
                  codeSent: (String verificationId,int? resendtoken){
              //  PhoneAuth.verify=verificationId;
                Navigator.push(context,MaterialPageRoute(builder: (context)=>OTPScreen(verficationid: verificationId,)));
                }, codeAutoRetrievalTimeout: (String id){},phoneNumber: phonecontroller.text.toString());
            }, child: Text("Verfiy", style:TextStyle(color: Colors.white),),
              style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.blue),
              ),
            ),
          ]
      ),
    );
  }
}
