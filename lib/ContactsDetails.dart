import 'dart:ui';

import 'package:flutter/material.dart';

class ContactsDetails extends StatelessWidget {
  String name, phone, email, address;

  ContactsDetails({this.name, this.phone, this.email, this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepOrange,
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
                      child: Icon(
                        Icons.call,
                        size: 30.0,
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
                      child: Icon(
                        Icons.message,
                        size: 30.0,
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
                  name,
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                //Text("Kathmandu, Nepal", style: TextStyle(fontSize: 14.0, color: Colors.red.shade700),)
              ],
            ),
          ),
//          Container(
//            // height: 50,
//            child: Row(
//              children: <Widget>[
//                Expanded(
//                  child: Container(
//                    color: Colors.deepOrange.shade300,
//                    child: ListTile(
//                      title: Text("50895",textAlign: TextAlign.center, style: TextStyle(
//                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0
//                      ),),
//                      subtitle: Text("FOLLOWERS", textAlign: TextAlign.center, style: TextStyle(color: Colors.red),),
//                    ),
//                  ),
//                ),
//                Expanded(
//                  child: Container(
//                    color: Colors.red,
//                    child: ListTile(
//                      title: Text("34524",textAlign: TextAlign.center, style: TextStyle(
//                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0
//                      ),),
//                      subtitle: Text("FOLLOWING", textAlign: TextAlign.center, style: TextStyle(color: Colors.white70),),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
          ListTile(
            title: Text(
              "Email",
              style: TextStyle(color: Colors.deepOrange, fontSize: 12.0),
            ),
            subtitle: Text(
              email,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Phone",
              style: TextStyle(color: Colors.deepOrange, fontSize: 12.0),
            ),
            subtitle: Text(
              phone,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Address",
              style: TextStyle(color: Colors.deepOrange, fontSize: 12.0),
            ),
            subtitle: Text(
              address,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Divider(),
//          ListTile(
//            title: Text("Facebook", style: TextStyle(color: Colors.deepOrange, fontSize: 12.0),),
//            subtitle: Text("facebook.com/ramkumar", style: TextStyle(fontSize: 18.0),),
//          ),
//          Divider(),
        ],
      ),
    );
  }
}

//class ContactsDetails extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        padding: EdgeInsets.all(20.0),
//        height: MediaQuery.of(context).size.height * 0.6,
//        decoration: BoxDecoration(
//            color: Colors.lightBlueAccent,
//            borderRadius: BorderRadius.only(
//                topRight: Radius.circular(50.0),
//                topLeft: Radius.circular(50.0))),
//        child: ListView(
//          children: <Widget>[
//            SizedBox(
//              height: 45.0,
//            ),
//            Name(),
//            SizedBox(
//              height: 25.0,
//            ),
//            Divider(
//              thickness: 2.0,
//              indent: 30.0,
//              endIndent: 30.0,
//            ),
//            SizedBox(
//              height: 25.0,
//            ),
//            PhoneNumber(),
//            SizedBox(
//              height: 25.0,
//            ),
//            Divider(
//              thickness: 2.0,
//              indent: 30.0,
//              endIndent: 30.0,
//            ),
//            SizedBox(
//              height: 25.0,
//            ),
//            Email(),
//            SizedBox(
//              height: 25.0,
//            ),
//            Divider(
//              thickness: 2.0,
//              indent: 30.0,
//              endIndent: 30.0,
//            ),
//            SizedBox(
//              height: 25.0,
//            ),
//            Address(),
//            SizedBox(
//              height: 25.0,
//            ),
//            Divider(
//              thickness: 2.0,
//              indent: 30.0,
//              endIndent: 30.0,
//            ),
//          ],
//        ));
//  }
//
//  Widget Email() {
//    return Row(
//      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      children: <Widget>[
//        CircleAvatar(
//          backgroundColor: Colors.transparent,
//          foregroundColor: Colors.blueGrey,
//          child: Icon(Icons.email),
//        ),
//        SizedBox(width: 15.0,),
//        Expanded(
//          flex: 1,
//          child: Text(
//            "E-Mail :",
//            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//          ),
//        ),
//        SizedBox(
//          width: 30.0,
//        ),
//        Expanded(
//          flex: 2,
//          child: Text(
//            "E-Mail-1",
//            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
//          ),
//        )
//      ],
//    );
//  }
//
//  Widget Address() {
//    return Row(
//      children: <Widget>[
//        CircleAvatar(
//          backgroundColor: Colors.transparent,
//          foregroundColor: Colors.blueGrey,
//          child: Icon(Icons.home),
//        ),
//        SizedBox(width: 15.0,),
//        Expanded(
//          flex: 1,
//            child: Text(
//          "Address :",
//          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//        )),
//        SizedBox(
//          width: 30.0,
//        ),
//        Expanded(
//          flex: 2,
//          child: Text(
//            "Address-1",
//            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
//          ),
//        )
//      ],
//    );
//  }
//
//  Widget PhoneNumber() {
//    return Row(
//      children: <Widget>[
//        CircleAvatar(
//          backgroundColor: Colors.transparent,
//          foregroundColor: Colors.blueGrey,
//          child: Icon(Icons.phone_android),
//        ),
//        SizedBox(width: 15.0,),
//        Expanded(
//          flex: 1,
//          child: Text(
//            "Phone :",
//            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//          ),
//        ),
//        SizedBox(
//          width: 30.0,
//        ),
//        Expanded(
//          flex: 2,
//          child: Text(
//            "Number-1",
//            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
//          ),
//        )
//      ],
//    );
//  }
//
//  Widget Name() {
//    return Row(
//      children: <Widget>[
//        CircleAvatar(
//          backgroundColor: Colors.transparent,
//          foregroundColor: Colors.blueGrey,
//          child: Icon(Icons.text_fields),
//        ),
//        SizedBox(width: 15.0,),
//        Expanded(
//          flex: 1,
//          child: Text(
//            "Name :",
//            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//          ),
//        ),
//        SizedBox(
//          width: 30.0,
//        ),
//        Expanded(
//          flex: 2,
//          child: Text(
//            "Name-1",
//            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
//          ),
//        )
//      ],
//    );
//  }
//}
