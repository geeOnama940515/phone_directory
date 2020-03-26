import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateSector extends StatefulWidget {

  String areaName;

  UpdateSector({this.areaName});

  @override
  State<StatefulWidget> createState() {
    return UpdateSectorState();
  }
}

class UpdateSectorState extends State<UpdateSector> {

  String newAreaName;
  TextEditingController areaController = TextEditingController();

  @override
  void initState(){
    super.initState();
    areaController.text=widget.areaName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Update'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height,
        color: Colors.lightBlueAccent,
        child: ListView(
          children: <Widget>[
            Text('Update Area name'),
            TextFormField(
              onChanged: (value) {
                newAreaName=value;
              },
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Enter the updated area name',
              ),
            ),
            MaterialButton(
              onPressed: () {
                FirebaseDatabase.instance.reference().child('area').child(widget.areaName).once().then((DataSnapshot snapshot){
                  print(snapshot.value);
                  var data=snapshot.value;
                  FirebaseDatabase.instance.reference().child('area').child(newAreaName).set(data);
                  FirebaseDatabase.instance.reference().child('area').child(widget.areaName).remove();
                });
              },
              child: Text('Update'),
            )
          ],
        ),
      ),
    );
  }
}
