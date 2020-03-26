import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class NewContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewContactState();
  }
}

class NewContactState extends State<NewContact> {

  String area,name,phone,email,address;

  TextEditingController areaController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseDatabase.instance.reference().child('area').child(area).child(name).set({'name':name,'phone':phone,'email':email,'address':address});
        },
        child: Icon(Icons.keyboard_arrow_right,size: 40.0,),
        backgroundColor: Colors.red,
      ),
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
                CircleAvatar(
                    minRadius: 60,
                    backgroundColor: Colors.deepOrange.shade300,
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.red,
                    )),
                //SizedBox(height: 10,),
                //Text('Name', style: TextStyle(fontSize: 22.0, color: Colors.white),),
                //Text("Kathmandu, Nepal", style: TextStyle(fontSize: 14.0, color: Colors.red.shade700),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
            child: TextFormField(
              onChanged: (value) {
                area=areaController.text;
              },
              keyboardType: TextInputType.text,
              controller: areaController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on,color: Colors.red,),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent,width: 2.0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0))),
                hintText: "Enter Area",
                hintStyle: TextStyle(fontSize: 20.0),
                labelStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),
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
              keyboardType: TextInputType.text,
              controller: nameController,
              onChanged: (value) {
                name=nameController.text;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person,color: Colors.red,),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter Name",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                      TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),
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
                phone=phoneController.text;
              },
              keyboardType: TextInputType.number,
              controller: phoneController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone,color: Colors.red,),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.redAccent,width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter Phone Number",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                      TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),
                  labelText: "Phone Number",
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
                email=emailController.text;
              },
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email,color: Colors.red,),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter E-mail",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                      TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),
                  labelText: "E-mail",
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
                address=addressController.text;
              },
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: addressController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.home,color: Colors.red,),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  hintText: "Enter Address",
                  hintStyle: TextStyle(fontSize: 20.0),
                  labelStyle:
                      TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),
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
