import "package:flutter/material.dart";
import 'package:phone_directory/SectorsDisplay.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Phone book directory',
    theme: ThemeData(
      //canvasColor: Colors.transparent,
      primaryColor: Colors.red,
    ),
    home: SectorsDisplay(),
  ));
}
