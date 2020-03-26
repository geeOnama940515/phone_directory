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

  String n1,n2,n3,n4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
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
          width: MediaQuery
              .of(context)
              .size
              .width,
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
                        trailing: popupMenu(listItems[index]),
                        onTap: () {
                          FirebaseDatabase.instance.reference().child('area')
                              .child(widget.name).child(listItems[index])
                              .once().then((DataSnapshot snapshot){
                                var data=snapshot.value;
                                n1=data['name'];
                                n2=data['phone'];
                                n3=data['email'];
                                n4=data['address'];
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ContactsDetails(name: n1,phone: n2,email: n3,address: n4,)));
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.1,
                  height: MediaQuery
                      .of(context)
                      .size
                      .width * 0.1,
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

  Widget popupMenu(name) {
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
        debugPrint('$value');
        (value == 1) ? update(name) : delete(name);
      },
      icon: Icon(Icons.more_vert),
    );
  }

  void update(name) {
    print(name);
    FirebaseDatabase.instance
        .reference()
        .child('area')
        .child(widget.name)
        .child(name)
        .set({'details': '2'});
    setState(() {});
  }

  void delete(name) {
    FirebaseDatabase.instance
        .reference()
        .child('area')
        .child(widget.name)
        .child(name)
        .remove();
    setState(() {});
  }
}
