import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phone_directory/ContactsDetails.dart';
import 'package:phone_directory/ContactsDisplay.dart';
import 'package:phone_directory/NewContact.dart';
import 'package:phone_directory/UpdateSector.dart';
import 'package:phone_directory/models/User.dart';

class SectorsDisplay extends StatefulWidget {
  String part;

  SectorsDisplay({this.part});

  @override
  State<StatefulWidget> createState() {
    return SectorsDisplayState();
  }
}

class SectorsDisplayState extends State<SectorsDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.add),
//          onPressed: () {
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (_) => NewContact(
//                          part: widget.part,
//                        ))).then((value) {
//              setState(() {});
//            });
//          },
//        ),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Jain PhoneBook Directory'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final User result = await showSearch(
                    context: context, delegate: UserSearch(part: widget.part));
                if (result != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ContactsDetails(
                                part: widget.part,
                                keys: result.key,
                                area: result.area,
                              )));
                }
              },
            )
          ],
        ),
        body: Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.all(5.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: getSectorView(context)));
  }

  Widget getSectorView(context) {
    Map data = {};
    List<String> listItems = [''];
    final response =
        FirebaseDatabase.instance.reference().child('area${widget.part}');
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: FutureBuilder(
        future: response.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            listItems.clear();
            Map<dynamic, dynamic> values = snapshot.data.value;
            if (values != null) {
              values.forEach((key, value) {
                if (key.toLowerCase().contains('sector')) {
                  data[key] = int.parse(key.split('-')[1]);
                } else {
                  listItems.add(key);
                }
              });
            }
            var sortedKeys = data.keys.toList(growable: false)
              ..sort((k1, k2) => data[k1].compareTo(data[k2]));
            LinkedHashMap sortedData = new LinkedHashMap.fromIterable(
                sortedKeys,
                key: (k) => k,
                value: (k) => data[k]);
            List sortedDataList = sortedData.keys.toList();
            listItems.sort();
            sortedDataList.addAll(listItems);
            return ListView.builder(
                itemCount: sortedDataList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.arrow_right),
                        title: Text(
                          sortedDataList[index],
                          style: TextStyle(color: Colors.indigo),
                        ),
                        //trailing: popupMenu(sortedDataList[index]),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ContactsDisplay(
                                        areaname: sortedDataList[index],
                                        part: widget.part,
                                      )));
                        },
                      ),
                      Divider(
                        color: Colors.red,
                        thickness: 0.7,
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

//  Widget popupMenu(area) {
//    return PopupMenuButton(
//      itemBuilder: (context) {
//        var list = List<PopupMenuEntry<Object>>();
//        list.add(
//          PopupMenuItem(
//            value: 1,
//            child: Text('Update'),
//          ),
//        );
//        list.add(PopupMenuItem(
//          value: 2,
//          child: Text('Delete'),
//        ));
//        return list;
//      },
//      onSelected: (value) {
//        (value == 1) ? update(area) : delete(area);
//      },
//      icon: Icon(Icons.more_vert),
//    );
//  }

  Future<void> onRefresh() async {
    setState(() {});
  }

//  void update(area) {
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (_) => UpdateSector(
//                  areaName: area,
//                  part: widget.part,
//                ))).then((value) {
//      setState(() {});
//    });
//  }
//
//  void delete(area) {
//    FirebaseDatabase.instance
//        .reference()
//        .child('area${widget.part}')
//        .child(area)
//        .remove();
//    setState(() {});
//  }
}

class UserSearch extends SearchDelegate<User> {
  String part;
  List<User> listItems = [];
  final res = FirebaseDatabase.instance.reference();

  UserSearch({this.part});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: res.child('area$part').once(),
      builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
        if (snapshot.hasData) {
          listItems.clear();
          Map<dynamic, dynamic> values = snapshot.data.value;
          if (values != null) {
            values.forEach((key, value) {
              value.forEach((key1, value1) {
                if (value1['name']
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    value1['address']
                        .toLowerCase()
                        .contains(query.toLowerCase())) {
                  listItems.add(User(
                      key: key1,
                      name: value1['name'],
                      address: value1['address'],
                      area: key));
                }
              });
            });
          }
          return ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listItems[index].name),
                subtitle: Text(listItems[index].address),
                leading: Icon(Icons.person),
                onTap: () {
                  close(context, listItems[index]);
                },
              );
            },
          );
        }
        return Center(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                child: CircularProgressIndicator()));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: res.child('area$part').once(),
      builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
        if (snapshot.hasData) {
          listItems.clear();
          Map<dynamic, dynamic> values = snapshot.data.value;
          if (values != null) {
            values.forEach((key, value) {
              value.forEach((key1, value1) {
                if (value1['name']
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    value1['address']
                        .toLowerCase()
                        .contains(query.toLowerCase())) {
                  listItems.add(User(
                      key: key1,
                      name: value1['name'],
                      address: value1['address'],
                      area: key));
                }
              });
            });
          }
          return ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listItems[index].name),
                subtitle: Text(listItems[index].address),
                leading: Icon(Icons.person),
                onTap: () {
                  close(context, listItems[index]);
                },
              );
            },
          );
        }
        return Center(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                child: CircularProgressIndicator()));
      },
    );
  }
}
