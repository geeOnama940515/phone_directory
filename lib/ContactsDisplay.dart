import 'package:flutter/material.dart';
import 'ContactTile.dart';
import 'ContactsDetails.dart';

class ContactsDisplay extends StatelessWidget {
  final String name;

  ContactsDisplay({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(name),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: getContactsView())),
    );
  }

  List<String> getContactsElements() {
    var items =
        List<String>.generate(10, (counter) => "Contact : ${counter + 1}");
    return items;
  }

  Widget getContactsView() {
    var listItems = getContactsElements();
    var listView = ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.tag_faces),
            title: Text(
              listItems[index],
              style: TextStyle(color: Colors.indigo),
            ),
            onTap: () {
              contactsDetails(context);
            },
          );
        });
    return listView;
  }

  void contactsDetails(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ContactsDetails();
        });
  }
}
