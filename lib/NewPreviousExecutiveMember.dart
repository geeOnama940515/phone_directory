import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class NewPreviousExecutiveMember extends StatefulWidget{
  String post;

  NewPreviousExecutiveMember({this.post});
  @override
  State<StatefulWidget> createState() {
    return NewPreviousExecutiveMemberState();
  }
}

class NewPreviousExecutiveMemberState extends State<NewPreviousExecutiveMember>{
  String name, startDate, endDate, priority;

  TextEditingController nameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController priorityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseDatabase.instance
              .reference()
              .child('previousExecutive')
              .child(widget.post)
          .child('members')
              .push()
              .set({
            'name': name,
            'startDate': startDate,
            'endDate': endDate,
            'priority': int.parse(priority)
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
        title: Text("Contact Details"),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
            child: TextFormField(
              onChanged: (value) {
                name = value;
              },
              keyboardType: TextInputType.text,
              controller: nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0))),
                hintText: "Enter Name",
                hintStyle: TextStyle(fontSize: 20.0),
                labelStyle:
                TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                labelText: "Name",
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
              keyboardType: TextInputType.text,
              controller: startDateController,
              onChanged: (value) {
                startDate = value;
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_today,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter Start Date",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  labelText: "Start Date",
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
                endDate = value;
              },
              keyboardType: TextInputType.number,
              controller: endDateController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_today,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter End Date",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  labelText: "End Date",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0)))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
            child: TextFormField(
              onChanged: (value) {
                priority = value;
              },
              keyboardType: TextInputType.emailAddress,
              controller: priorityController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.swap_vert,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter Priority",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  labelText: "Priority",
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