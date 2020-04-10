import 'dart:async';
import 'package:flutter/material.dart';
import 'package:phone_directory/Advertisement.dart';

class Description extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DescriptionState();
  }
}

class DescriptionState extends State<Description> {
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
//    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => CarouselDemo()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green, Color(0xffffcc00)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.25, 1.0])),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => CarouselDemo()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.black45,
                          ),
//                          margin: EdgeInsets.only(right: 20.0, top: 30.0),
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            'Next Page',
                            style: TextStyle(color: Colors.white,fontSize: 17.0),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('| Shri Adinathay Namah |',
                        style: TextStyle(
                            color: Color(0xff990099), fontSize: 17.0)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Shri Adinath Digamber Jain Sabha(Regd.)',
                        style: TextStyle(
                            color: Color(0xffbb0000),
                            fontSize: 23.0,
                            fontWeight: FontWeight.w700),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'J-72, Sector-10(DLF), Faridabad',
                      style: TextStyle(
                          color: Color(0xff990099),
                          fontSize: 23.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Color(0xff0000bb),
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Of',
                        style: TextStyle(
                            color: Color(0xffe25822),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Members',
                        style: TextStyle(
                            color: Color(0xff0000bb),
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '( Phone-Book )',
                      style: TextStyle(
                          color: Color(0xfffe346e),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          fontSize: 40.0),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Copyright '),
                      Icon(Icons.copyright),
                      Text(' 1998')
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Developed by :',
                              style: TextStyle(
                                  color: Color(0xff916dd5),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600)),
                          Text('Hiten Jain', style: TextStyle(fontSize: 17.0)),
                          Text('9990026792', style: TextStyle(fontSize: 17.0))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Concept :',
                              style: TextStyle(
                                  color: Color(0xff916dd5),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600)),
                          Text('Namrata Jain',
                              style: TextStyle(fontSize: 17.0)),
                          Text('8510888297', style: TextStyle(fontSize: 17.0))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Edited by :',
                              style: TextStyle(
                                  color: Color(0xff916dd5),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600)),
                          Text('Khushboo Jain',
                              style: TextStyle(fontSize: 17.0)),
                          Text('9212866590', style: TextStyle(fontSize: 17.0))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
