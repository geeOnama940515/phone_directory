import 'package:flutter/material.dart';

class Patrons extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PatronsState();
  }
}

class PatronsState extends State<Patrons>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patrons'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.only(top: 15.0,right: 5.0,left: 5.0,bottom: 5.0),
      ),
    );
  }
}