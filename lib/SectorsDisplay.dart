import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:phone_directory/ContactsDisplay.dart';

class SectorsDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: getSectorView(context));
  }
}

Widget getSectorView(context) {
  List<String> listItems = [''];
  final response = FirebaseDatabase.instance.reference().child('area');
  return FutureBuilder(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ContactsDisplay(
                                    name: listItems[index],
                                  )));
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
            width: MediaQuery.of(context).size.width*0.1,
              height: MediaQuery.of(context).size.width*0.1,
              child: CircularProgressIndicator()
          )
      );
    },
  );
}
