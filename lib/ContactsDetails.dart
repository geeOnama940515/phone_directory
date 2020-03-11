import 'package:flutter/material.dart';

class ContactsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.0),
                topLeft: Radius.circular(50.0))),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 45.0,
            ),
            Name(),
            SizedBox(
              height: 25.0,
            ),
            Divider(
              thickness: 2.0,
              indent: 30.0,
              endIndent: 30.0,
            ),
            SizedBox(
              height: 25.0,
            ),
            PhoneNumber(),
            SizedBox(
              height: 25.0,
            ),
            Divider(
              thickness: 2.0,
              indent: 30.0,
              endIndent: 30.0,
            ),
            SizedBox(
              height: 25.0,
            ),
            Email(),
            SizedBox(
              height: 25.0,
            ),
            Divider(
              thickness: 2.0,
              indent: 30.0,
              endIndent: 30.0,
            ),
            SizedBox(
              height: 25.0,
            ),
            Address(),
            SizedBox(
              height: 25.0,
            ),
            Divider(
              thickness: 2.0,
              indent: 30.0,
              endIndent: 30.0,
            ),
          ],
        ));
  }

  Widget Email() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blueGrey,
          child: Icon(Icons.email),
        ),
        SizedBox(width: 15.0,),
        Expanded(
          flex: 1,
          child: Text(
            "E-Mail :",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          flex: 2,
          child: Text(
            "E-Mail-1",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
        )
      ],
    );
  }

  Widget Address() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blueGrey,
          child: Icon(Icons.home),
        ),
        SizedBox(width: 15.0,),
        Expanded(
          flex: 1,
            child: Text(
          "Address :",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        )),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          flex: 2,
          child: Text(
            "Address-1",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
        )
      ],
    );
  }

  Widget PhoneNumber() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blueGrey,
          child: Icon(Icons.phone_android),
        ),
        SizedBox(width: 15.0,),
        Expanded(
          flex: 1,
          child: Text(
            "Phone :",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          flex: 2,
          child: Text(
            "Number-1",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
        )
      ],
    );
  }

  Widget Name() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blueGrey,
          child: Icon(Icons.text_fields),
        ),
        SizedBox(width: 15.0,),
        Expanded(
          flex: 1,
          child: Text(
            "Name :",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          flex: 2,
          child: Text(
            "Name-1",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
        )
      ],
    );
  }
}
