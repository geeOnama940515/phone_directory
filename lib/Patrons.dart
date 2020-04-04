import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:phone_directory/NewPatron.dart';
import 'package:phone_directory/UpdatePatron.dart';
import 'PatronDetails.dart';
import 'models/User.dart';

class Patrons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PatronsState();
  }
}

class PatronsState extends State<Patrons> {
  final response = FirebaseDatabase.instance.reference().child('patrons');
  List<User> listItems = [];
  List<User> listItems2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          Navigator.push(context,
//              MaterialPageRoute(builder: (_) => NewPatron()))
//              .then((value) {
//            setState(() {});
//          });
//        },
//        child: Icon(Icons.add),
//      ),
      appBar: AppBar(
        title: Text('Patrons Members'),
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
                listItems2.clear();
                Map<dynamic, dynamic> values = snapshot.data.value;
                if (values != null) {
                  values.forEach((key, value) {
                    if (value['since'].toLowerCase().contains('deceased')) {
                      listItems2.add(User(
                          name: value['name'],
                          key: key,
                          phone: value['phone'],
                          address: value['address'],
                          relation: value['relation'],
                          since: value['since'],
                          priority: value['priority']));
                    } else {
                      listItems.add(User(
                          name: value['name'],
                          key: key,
                          phone: value['phone'],
                          address: value['address'],
                          relation: value['relation'],
                          since: value['since']));
                    }
                  });
                }
                listItems.sort((a, b) => a.since.compareTo(b.since));
                listItems2.sort((a, b) => a.priority.compareTo(b.priority));
                listItems.addAll(listItems2);
                return ListView.builder(
                    itemCount: listItems.length,
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
                            //trailing: popupMenu(listItems[index]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PatronDetails(
                                            user: listItems[index],
                                          )));
                            },
//                            subtitle: Text(
//                              listItems[index].since,
//                              style: TextStyle(fontSize: 15.0),
//                            ),
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
//            builder: (_) =>
//                UpdatePatron(user: user)))
//        .then((value) {
//      setState(() {});
//    });
//  }
//
//  void delete(user) {
//    FirebaseDatabase.instance
//        .reference()
//        .child('patrons')
//        .child(user.key)
//        .remove();
//    setState(() {});
//  }
}
