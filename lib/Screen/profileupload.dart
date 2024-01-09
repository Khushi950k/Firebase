import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Widgets/uihelper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImages extends StatefulWidget {
  const AddImages({super.key});

  @override
  State<AddImages> createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> {
  TextEditingController imgController=TextEditingController();
  File? pickedImage;
  uploadimage(String imgname)async{
    if(imgname=="" && pickedImage==null){
      return log("Enter Required Fields");
    }
    else{
      UploadTask uploadTask= FirebaseStorage.instance.ref("Profile Pictures").child(imgname).putFile(pickedImage!);
      TaskSnapshot taskSnapshot=await uploadTask;
      String img=await taskSnapshot.ref.getDownloadURL();
      String imagename=imgname;
      FirebaseFirestore.instance.collection("Users").doc(imgname).set({
        "ImageName":imgname,
        "ImageURL":img
      }).then((value){
        log("Image Uploaded");
      });
    }
  }

  _imageselector(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Pick Image From"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: (){
                imagepick(ImageSource.camera);
                Navigator.pop(context);
              },
              leading: Icon(Icons.camera_alt),
              title: Text("Camera"),
            ),
            ListTile(
              onTap: (){
                imagepick(ImageSource.gallery);
                Navigator.pop(context);
              },
              leading: Icon(Icons.image),
              title: Text("Gallery"),
            )
          ],),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Images", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                _imageselector();
              },
              child:pickedImage!=null? CircleAvatar(
                radius: 60,
                backgroundImage:FileImage(pickedImage!),
              ):CircleAvatar(
                radius: 60,
                child: Icon(Icons.person,size: 60,),
              ),
            ),
            SizedBox(height: 30),
            UiHelper.CustomTextField(imgController," Enter Image Name", Icons.image, false),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (){
              uploadimage(imgController.text.toString());
            }, child: Text("Upload Image"))
          ],
        ),
      ),
    );
  }

  imagepick(ImageSource imageSource)async{
    try{
      final img=await ImagePicker().pickImage(source: imageSource);
      if(img==null)return;
      final tempimage=File(img.path);
      setState(() {
        pickedImage=tempimage;
      });
    }catch(ex){
      log(ex.toString());
    }
  }
}