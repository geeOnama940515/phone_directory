import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:phone_directory/ExecutiveBoardDetails.dart';
import 'package:phone_directory/NewExecutiveBoard.dart';
import 'package:phone_directory/UpdateExecutiveBoard.dart';
import 'models/User.dart';

class ExecutiveBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExecutiveBoardState();
  }
}

class ExecutiveBoardState extends State<ExecutiveBoard> {
  final response =
      FirebaseDatabase.instance.reference().child('executiveBoard');
  List<User> listItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (_) => NewExecutiveBoard()))
              .then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Executive Members'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.only(top: 15.0, right: 5.0, left: 5.0, bottom: 5.0),
        child: RefreshIndicator(
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
                        name: value['name'],
                        key: key,
                        priority: value['priority'],
                        phone: value['phone'],
                        address: value['address'],
                        designation: value['designation']));
                  });
                }
//                print(listItems);
//                print(listItems.length);
                listItems.forEach((element) {print(element.priority);});
                listItems.sort((a, b) => a.priority.compareTo(b.priority));
                print(listItems);
                print(listItems.length);
                return ListView.builder(
                    itemCount: listItems.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text(
                              listItems[index].designation,
                              style: TextStyle(color: Colors.indigo),
                            ),
                            trailing: popupMenu(listItems[index]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ExecutiveBoardDetails(
                                            user: listItems[index],
                                          )));
                            },
                            subtitle: Text(
                              listItems[index].name,
                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                            ),
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
        ),
      ),
    );
  }

  Future<void> onRefresh() async {
    setState(() {});
  }

  Widget popupMenu(user) {
    return PopupMenuButton(
      itemBuilder: (context) {
        var list = List<PopupMenuEntry<Object>>();
        list.add(
          PopupMenuItem(
            value: 1,
            child: Text('Update'),
          ),
        );
        list.add(PopupMenuItem(
          value: 2,
          child: Text('Delete'),
        ));
        return list;
      },
      onSelected: (value) {
        (value == 1) ? update(user) : delete(user);
      },
      icon: Icon(Icons.more_vert),
    );
  }

  void update(user) {
    Navigator.push(context,
            MaterialPageRoute(builder: (_) => UpdateExecutiveBoard(user: user)))
        .then((value) {
      setState(() {});
    });
  }

  void delete(user) {
    FirebaseDatabase.instance
        .reference()
        .child('executiveBoard')
        .child(user.key)
        .remove();
    setState(() {});
  }
}
