import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DBRef = FirebaseDatabase.instance.reference();
  String dota;
  @override
  
  Widget build(BuildContext context) {
    dataRead();
    return MaterialApp( 
      title: "MSI",
      home: Scaffold(
      body: Row(
        children:<Widget>[
          RaisedButton(
            child: Text("Write Data"),
            onPressed:(){
              writeData();
            } ,
          ),

          RaisedButton(
            child: Text("Read Data"),
            onPressed: (){
              readData();
          }),
          Text("dota")
        ]
      ),
      ),
    );
  }
  void writeData(){
      DBRef.child("1").set({
        'id':'ID1',
        'data':'This is a sample Datu'
      });
  }
  void readData(){
    DBRef.child("1/data").once().then((DataSnapshot dataSanapShot){
        String data = dataSanapShot.value;
        print(data);
    });
    DBRef.once().then((DataSnapshot dataSnapShot){
      print(dataSnapShot.value);
    });
  }
  void updateData(){
    DBRef.child("1").update({
      'data':'sayang'
    });
  }
  void delate(){
    DBRef.child("1").remove();
  }

  void dataRead(){
     DBRef.child("1/data").once().then((DataSnapshot dataSanapShot){
        dota= dataSanapShot.value;
        print(dota);
    });
  }
}