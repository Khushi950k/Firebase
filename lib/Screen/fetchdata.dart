import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Builder", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").orderBy("Email", descending: true).snapshots(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.active){
              if(snapshot.hasData){
                return ListView.builder(itemBuilder: (context,index){
                  return ListTile(
                    leading: CircleAvatar(child: Text("${index+1}")),
                    title: Text("${snapshot.data!.docs[index]["Email"]}"),
                  );
                },itemCount: snapshot.data!.docs.length,);
              }
              else if(snapshot.hasError){
                return Center(child: Text("${snapshot.hasError.toString()}"),);
              }
              else{
                return Center(child: Text("Data Not Found!!"),);
              }
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          }),
    );
  }
}