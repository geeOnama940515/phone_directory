import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phone_directory/ContactsDisplay.dart';
import 'package:phone_directory/NewContact.dart';
import 'package:phone_directory/UpdateSector.dart';

class SectorsDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SectorsDisplayState();
  }
}

class SectorsDisplayState extends State<SectorsDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => NewContact()));
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Jain PhoneBook Directory'),
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
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: getSectorView(context)));
  }

  Widget getSectorView(context) {
    List<String> listItems = [''];
    final response = FirebaseDatabase.instance.reference().child('area');
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
//                        onLongPress: () {
//                          showMenu(
//                            position: RelativeRect.fromRect(rect, container),
//                              context: context,
//                              items: <PopupMenuEntry>[
//                                PopupMenuItem(
//                                  child: Text('Update'),
//                                ),
//                                PopupMenuItem(
//                                  child: Text('Delete'),
//                                ),
//                              ]
//                          );
//                        },
                        trailing: popupMenu(listItems[index]),
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
                        thickness: 1.2,
                        indent: 15.0,
                        endIndent: 15.0,
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

  Widget popupMenu(area) {
    return PopupMenuButton(
      itemBuilder: (context) {
        var list = List<PopupMenuEntry<Object>>();
        list.add(
          PopupMenuItem(
            value: 1,
            child: Text('Update'),
          ),
        );
//        list.add(
//          PopupMenuDivider()
//        );
        list.add(PopupMenuItem(
          value: 2,
          child: Text('Delete'),
        ));
        return list;
      },
      onSelected: (value) {
        (value == 1) ? update(area) : delete(area);
      },
      icon: Icon(Icons.more_vert),
    );
  }

  Future<void> onRefresh() async {
    setState(() {});
  }

  void update(area) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => UpdateSector(areaName: area)));
  }

  void delete(area) {
    FirebaseDatabase.instance.reference().child('area').child(area).remove();
    setState(() {});
  }
}
