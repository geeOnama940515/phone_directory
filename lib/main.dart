import "package:flutter/material.dart";
import 'package:phone_directory/SectorsDisplay.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Phone book directory',
    theme: ThemeData(
      //canvasColor: Colors.transparent,
      primaryColor: Colors.green,
    ),
    home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Jain PhoneBook Directory'),
        ),
        body: SectorsDisplay()),
  ));
}
