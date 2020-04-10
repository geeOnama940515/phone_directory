import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:phone_directory/UpdateContact.dart';
import 'package:phone_directory/models/User.dart';
import 'ContactsDetails.dart';

class ContactsDisplay extends StatefulWidget {
  final String areaname, part;

  ContactsDisplay({this.areaname, this.part});

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
        backgroundColor: Colors.red,
        title: Text(widget.areaname),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final User user = await showSearch(
                  context: context,
                  delegate:
                      UserSearch(areaName: widget.areaname, part: widget.part));
              if (user != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ContactsDetails(
                              part: widget.part,
                              area: widget.areaname,
                              keys: user.key,
                            )));
              }
            },
          )
        ],
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: getContactsView(context)),
    );
  }

  Widget getContactsView(context) {
    List<User> listItems = [];
    final response = FirebaseDatabase.instance
        .reference()
        .child('area${widget.part}')
        .child(widget.areaname);
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
                listItems.add(User(
                    key: key,
                    name: value['name'],
                    phone: value['phone'],
                    email: value['email'],
                    address: value['address']));
              });
            }
            listItems.sort((a, b) => a.name.compareTo(b.name));
            return ListView.builder(
                itemCount: listItems.length == 0 ? 0 : listItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          listItems[index].name,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
//                        trailing: popupMenu(listItems[index]),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ContactsDetails(
                                        part: widget.part,
                                        area: widget.areaname,
                                        keys: listItems[index].key,
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

  Future<void> onRefresh() async {
    setState(() {});
  }

//  Widget popupMenu(user) {
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
//        (value == 1) ? update(user) : delete(user);
//      },
//      icon: Icon(Icons.more_vert),
//    );
//  }
//
//  void update(user) {
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (_) => UpdateContact(
//                  areaName: widget.areaname,
//                  user: user,
//                  part: widget.part,
//                ))).then((value) {
//      setState(() {});
//    });
//  }
//
//  void delete(user) {
//    FirebaseDatabase.instance
//        .reference()
//        .child('area${widget.part}')
//        .child(widget.areaname)
//        .child(user.key)
//        .remove();
//    setState(() {});
//  }
}

class UserSearch extends SearchDelegate<User> {
  String areaName, part;
  List<User> listItems = [];
  final res = FirebaseDatabase.instance.reference();

  UserSearch({this.areaName, this.part});

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
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: res.child('area$part').child(areaName).once(),
      builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
        if (snapshot.hasData) {
          listItems.clear();
          Map<dynamic, dynamic> values = snapshot.data.value;
          if (values != null) {
            values.forEach((key, value) {
              if (value['name'].toLowerCase().contains(query.toLowerCase())) {
                listItems.add(User(
                    key: key, name: value['name'], address: value['address']));
              }
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
      future: res.child('area$part').child(areaName).once(),
      builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
        if (snapshot.hasData) {
          listItems.clear();
          Map<dynamic, dynamic> values = snapshot.data.value;
          if (values != null) {
            values.forEach((key, value) {
              if (value['name'].toLowerCase().contains(query.toLowerCase())) {
                listItems.add(User(
                    key: key, name: value['name'], address: value['address']));
              }
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
