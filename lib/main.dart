import 'package:firebase/Screen/adddata.dart';
import 'package:firebase/Screen/checkuser.dart';
import 'package:firebase/Screen/fetchdata.dart';
import 'package:firebase/Screen/profileupload.dart';
import 'package:firebase/Screen/signup_screen.dart';
import 'package:firebase/Screen/verfiy_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AddImages()
    );
  }
}



