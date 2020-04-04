import 'dart:async';
import 'package:flutter/material.dart';
import 'package:phone_directory/Description.dart';

class CoverPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CoverPageState();
  }
}

class CoverPageState extends State<CoverPage>{

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Description()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage('assets/ad1.jpeg'),
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Description()));
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.black45,
                  ),
                  margin: EdgeInsets.only(top: 30.0, right: 20.0),
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
