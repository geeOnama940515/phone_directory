import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:phone_directory/models/Temple.dart';

class UpdateTemple extends StatefulWidget {
  Temple temple;

  UpdateTemple({this.temple});

  @override
  State<StatefulWidget> createState() {
    return UpdateTempleState();
  }
}

class UpdateTempleState extends State<UpdateTemple> {
  String name, area, address;
  int priority;

  TextEditingController nameController,
      priorityController,
      areaController,
      addressController;

  @override
  void initState() {
    super.initState();

    name = widget.temple.name;
    area = widget.temple.area;
    priority = widget.temple.priority;
    address = widget.temple.address;

    nameController = TextEditingController(text: widget.temple.name);
    areaController = TextEditingController(text: widget.temple.area);
    priorityController =
        TextEditingController(text: (widget.temple.priority).toString());
    addressController = TextEditingController(text: widget.temple.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseDatabase.instance
              .reference()
              .child('temple')
              .child(widget.temple.key)
              .set({
            'name': name,
            'address': address,
            'priority': priority,
            'area': area
          });
          Navigator.pop(context, true);
        },
        child: Icon(
          Icons.keyboard_arrow_right,
          size: 40.0,
        ),
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        title: Text("Update Temple Details"),
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
                CircleAvatar(
                    minRadius: 60,
                    backgroundColor: Colors.deepOrange.shade300,
                    child: Icon(
                      Icons.location_on,
                      size: 80,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: nameController,
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter New Name",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  labelText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0)))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
            child: TextFormField(
              onChanged: (value) {
                area = areaController.text;
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
                hintText: "Enter New Area",
                hintStyle: TextStyle(fontSize: 20.0),
                labelStyle:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                labelText: "Area",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
            child: TextFormField(
              onChanged: (value) {
                priority = int.parse(priorityController.text);
              },
              keyboardType: TextInputType.text,
              controller: priorityController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.swap_vertical_circle,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0))),
                hintText: "Enter Priority",
                hintStyle: TextStyle(fontSize: 20.0),
                labelStyle:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                labelText: "priority",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
            child: TextFormField(
              onChanged: (value) {
                address = addressController.text;
              },
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: addressController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.home,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter New Address",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  labelText: "Address",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0)))),
            ),
          ),
        ],
      ),
    );
  }
}
