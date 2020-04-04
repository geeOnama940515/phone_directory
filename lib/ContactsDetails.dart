import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ContactsDetails extends StatefulWidget {
  String area, keys, name, phone, address, email, part;

  ContactsDetails({this.area, this.keys, this.part});

  @override
  State<StatefulWidget> createState() {
    return ContactsDetailsState();
  }
}

class ContactsDetailsState extends State<ContactsDetails> {
  Future<void> _launched;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contact Details"),
          backgroundColor: Colors.red,
          elevation: 0,
        ),
        body: FutureBuilder(
          future: FirebaseDatabase.instance
              .reference()
              .child('area${widget.part}')
              .child(widget.area)
              .child(widget.keys)
              .once(),
          builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
            if (snapshot.hasData) {
              Map<dynamic, dynamic> values = snapshot.data.value;
              if (values != null) {
                values.forEach((key, value) {
                  if (key == 'phone') {
                    widget.phone = value;
                  } else if (key == 'email') {
                    widget.email = value;
                  } else if (key == 'address') {
                    widget.address = value;
                  } else if (key == 'name') {
                    widget.name = value;
                  }
                });
              }
              return ListView(
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
                                        _makePhoneCall('tel:${widget.phone.split(',')[0]}');
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
                                        _makePhoneCall('sms:${widget.phone.split(',')[0]}');
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
                          widget.name,
                          style: TextStyle(fontSize: 22.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        _launched =
                            _makePhoneCall('tel:${widget.phone.split(',')[0]}');
                      });
                    },
                    title: Text(
                      "Phone",
                      style:
                          TextStyle(color: Colors.deepOrange, fontSize: 15.0),
                    ),
                    subtitle: Text(
                      widget.phone,
                      style: TextStyle(fontSize: 18.0, color: Colors.black87),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Email",
                      style:
                          TextStyle(color: Colors.deepOrange, fontSize: 15.0),
                    ),
                    subtitle: Text(
                      widget.email,
                      style: TextStyle(fontSize: 18.0, color: Colors.black87),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Address",
                      style:
                          TextStyle(color: Colors.deepOrange, fontSize: 15.0),
                    ),
                    subtitle: Text(
                      widget.address,
                      style: TextStyle(fontSize: 18.0, color: Colors.black87),
                    ),
                  ),
                  Divider(),
                ],
              );
            }
            return Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.width * 0.1,
                    child: CircularProgressIndicator()));
          },
        ));
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Cannot call ${widget.phone}';
    }
  }
}
