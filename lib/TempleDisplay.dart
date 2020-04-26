import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:phone_directory/NewTemple.dart';
import 'package:phone_directory/UpdateTemple.dart';
import 'package:phone_directory/models/Temple.dart';

class TempleDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TempleDisplayState();
  }
}

class TempleDisplayState extends State<TempleDisplay> {
  List<Temple> listItems = [];
  var response = FirebaseDatabase.instance.reference().child('temple');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => NewTemple()))
              .then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Mandir in Faridabad'),
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
                    listItems.add(Temple(
                        key: key,
                        area: value['area'],
                        name: value['name'],
                        address: value['address'],
                        priority: value['priority']));
                  });
                }
                listItems.sort((a, b) => a.priority.compareTo(b.priority));
                return ListView.builder(
                    itemCount: listItems.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text(
                              listItems[index].name,
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            trailing: popupMenu(listItems[index]),
                            subtitle: Text(
                              listItems[index].address,
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

  Widget popupMenu(temple) {
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
        (value == 1) ? update(temple) : delete(temple);
      },
      icon: Icon(Icons.more_vert),
    );
  }

  void update(temple) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => UpdateTemple(
                  temple: temple,
                ))).then((value) {
      setState(() {});
    });
  }

  void delete(user) {
    FirebaseDatabase.instance
        .reference()
        .child('temple')
        .child(user.key)
        .remove();
    setState(() {});
  }
}
