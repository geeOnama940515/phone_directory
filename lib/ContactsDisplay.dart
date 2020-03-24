import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'ContactsDetails.dart';

class ContactsDisplay extends StatefulWidget {
  final String name;

  ContactsDisplay({this.name});

  @override
  State<StatefulWidget> createState() {
    return ContactsDisplayState();
  }
}

class ContactsDisplayState extends State<ContactsDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {});
            },
          )
        ],
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: getContactsView(context))),
    );
  }

  Widget getContactsView(context) {
    List<String> listItems = [''];
    final response =
        FirebaseDatabase.instance.reference().child('area').child(widget.name);
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: FutureBuilder(
        future: response.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            listItems.clear();
            Map<dynamic, dynamic> values = snapshot.data.value;
            values.forEach((key, value) {
              listItems.add(key);
            });
            listItems.sort();
            return ListView.builder(
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.arrow_right),
                        title: Text(
                          listItems[index],
                          style: TextStyle(color: Colors.indigo),
                        ),
                        onTap: () {
                          contactsDetails(context);
                        },
                      ),
                      Divider(
                        color: Colors.indigo,
                        thickness: 2.0,
                        indent: 40.0,
                        endIndent: 40.0,
                      )
                    ],
                  );
                });
          }
          return Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                  child: CircularProgressIndicator()));
        },
      ),
    );
  }

  Future<void> onRefresh() async {
    setState(() {});
  }

  void contactsDetails(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ContactsDetails();
        });
  }
}
