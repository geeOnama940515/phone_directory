import 'dart:async';
import 'package:flutter/material.dart';
import 'package:phone_directory/CoverPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => CoverPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Color(0xffffcc00)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.25, 1.0])),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image(
              image: AssetImage('assets/logo.png'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Jai Jinendra',
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffda0000)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
