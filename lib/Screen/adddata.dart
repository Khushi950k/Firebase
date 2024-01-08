import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Widgets/uihelper.dart';
import 'package:flutter/material.dart';
class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController titleController=TextEditingController();
  TextEditingController descController=TextEditingController();

  adddata(String title,String desc){
    if(title=="" && desc==""){
      log("Enter Required Fields");
    }
    else{
      FirebaseFirestore.instance.collection("Notes").doc(title).set({
        "Title":title,
        "Description":desc,
      }).then((value){
        log("Data Inserted");
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>FetchData()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(titleController,"Title", Icons.title, false),
          UiHelper.CustomTextField(descController, "Description", Icons.description,false),
          SizedBox(height: 30),
          ElevatedButton(onPressed: (){
            adddata(titleController.text.toString(), descController.text.toString());
          }, child: Text("Add Data",style:TextStyle(color: Colors.white),),
            style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.blue),
            ),)

        ],),
    );
  }
}