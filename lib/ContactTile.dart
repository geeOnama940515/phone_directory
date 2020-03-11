import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.tealAccent),
      margin: EdgeInsets.all(7.0),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.tealAccent,
            radius: 40.0,
            child: Icon(
              Icons.face,
              size: 60.0,
              color: Colors.red,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.018,
              ),
              Text(
                'Name',
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.25,
                  fontSize: 20.0,
                  //height: 10.0
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Text('Phone Number',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.25,
                fontSize: 15.0
              ),)
            ],
          ),
        ],
      ),
    );
  }
}
