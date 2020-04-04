import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'models/User.dart';

class PatronDetails extends StatefulWidget {
  User user;

  PatronDetails({this.user});

  @override
  State<StatefulWidget> createState() {
    return PatronDetailsState();
  }
}

class PatronDetailsState extends State<PatronDetails> {
  Future<void> _launched;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contact Details"),
          backgroundColor: Colors.red,
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.5, 0.9],
                      colors: [Colors.red, Colors.deepOrange.shade300])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        child: IconButton(
                          icon: Icon(
                            Icons.call,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              _launched =
                                  _makePhoneCall('tel:${widget.user.phone.split(',')[0]}');
                            });
                          },
                          color: Colors.deepOrange.shade100,
                        ),
                        minRadius: 30.0,
                        backgroundColor: Colors.red.shade600,
                      ),
                      CircleAvatar(
                          minRadius: 60,
                          backgroundColor: Colors.deepOrange.shade300,
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.red,
                          )),
                      CircleAvatar(
                        child: IconButton(
                          icon: Icon(
                            Icons.message,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              _launched =
                                  _makePhoneCall('sms:${widget.user.phone.split(',')[0]}');
                            });
                          },
                          color: Colors.deepOrange.shade100,
                        ),
                        minRadius: 30.0,
                        backgroundColor: Colors.red.shade600,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.user.name,
                    style: TextStyle(fontSize: 22.0, color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Father/Mother/Husband",
                style: TextStyle(color: Colors.deepOrange, fontSize: 15.0),
              ),
              subtitle: Text(
                widget.user.relation,
                style: TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                setState(() {
                  _launched =
                      _makePhoneCall('tel:${widget.user.phone.split(',')[0]}');
                });
              },
              title: Text(
                "Phone",
                style: TextStyle(color: Colors.deepOrange, fontSize: 15.0),
              ),
              subtitle: Text(
                widget.user.phone,
                style: TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Address",
                style: TextStyle(color: Colors.deepOrange, fontSize: 15.0),
              ),
              subtitle: Text(
                widget.user.address,
                style: TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
            ),
            Divider(),
          ],
        ));
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Cannot call ${widget.user.phone}';
    }
  }
}
