import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateSector extends StatefulWidget {
  String areaName,part;

  UpdateSector({this.areaName,this.part});

  @override
  State<StatefulWidget> createState() {
    return UpdateSectorState();
  }
}

class UpdateSectorState extends State<UpdateSector> {
  String newAreaName;
  TextEditingController areaController;

  @override
  void initState() {
    super.initState();
    areaController = TextEditingController(text: widget.areaName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseDatabase.instance
              .reference()
              .child('area${widget.part}')
              .child(widget.areaName)
              .once()
              .then((DataSnapshot snapshot) {
            var data = snapshot.value;
            FirebaseDatabase.instance
                .reference()
                .child('area${widget.part}')
                .child(newAreaName)
                .set(data);
            FirebaseDatabase.instance
                .reference()
                .child('area${widget.part}')
                .child(widget.areaName)
                .remove();
          });
          Navigator.pop(context,true);
        },
        child: Icon(
          Icons.keyboard_arrow_right,
          size: 40.0,
        ),
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Update Area Name'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0, left: 12.0, right: 12.0),
        height: MediaQuery.of(context).size.height,
        child: TextFormField(
          autofocus: true,
          onChanged: (value) {
            newAreaName = value;
          },
          keyboardType: TextInputType.text,
          controller: areaController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.location_on,
              color: Colors.red,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0))),
            hintText: "Area Name",
            hintStyle: TextStyle(fontSize: 20.0),
            labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            labelText: "Enter New Area Name",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0))),
          ),
        ),
      ),
    );
  }
}
