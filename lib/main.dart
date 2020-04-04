import "package:flutter/material.dart";
import 'package:phone_directory/SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Phone book directory',
    theme: ThemeData(
      primaryColor: Colors.red,
    ),
    home: SplashScreen(),
  ));
}
