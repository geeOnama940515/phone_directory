import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:phone_directory/NewPreviousExecutiveMember.dart';
import 'package:phone_directory/models/PreviousExecutiveModel.dart';

import 'UpdatePreviousExecutiveMembers.dart';

class PreviousExecutiveMembers extends StatefulWidget {
  String post;

  PreviousExecutiveMembers({this.post});

  @override
  State<StatefulWidget> createState() {
    return PreviousExecutiveMembersState();
  }
}

class PreviousExecutiveMembersState extends State<PreviousExecutiveMembers> {
  List<Executive> listItems = [];
  var response =
      FirebaseDatabase.instance.reference().child('previousExecutive');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => NewPreviousExecutiveMember(
                        post: widget.post,
                      ))).then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(widget.post),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.only(top: 15.0, right: 5.0, left: 5.0, bottom: 5.0),
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: FutureBuilder(
            future: response.child(widget.post).child('members').once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                listItems.clear();
                Map<dynamic, dynamic> values = snapshot.data.value;
                if (values != null) {
                  values.forEach((key, value) {
                    listItems.add(Executive(
                        key: key,
                        name: value['name'],
                        endDate: value['endDate'],
                        startDate: value['startDate'],
                        priority: value['priority'],
                        post: widget.post));
                  });
                }
                listItems.sort((a, b) => a.priority.compareTo(b.priority));
                //listItems.sort((a, b) => a.priority.compareTo(b.priority));
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
                            trailing: popupMenu(listItems[index]),
                            subtitle: Text(
                              '${listItems[index].startDate} - ${listItems[index].endDate}',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
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

  Widget popupMenu(executive) {
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
        (value == 1) ? update(executive) : delete(executive);
      },
      icon: Icon(Icons.more_vert),
    );
  }

  void update(executive) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => UpdatePreviousExecutiveMembers(
                  executive: executive,
                ))).then((value) {
      setState(() {});
    });
  }

  void delete(executive) {
    FirebaseDatabase.instance
        .reference()
        .child('previousExecutive')
        .child(widget.post)
        .child('members')
        .child(executive.key)
        .remove();
    setState(() {});
  }
}
