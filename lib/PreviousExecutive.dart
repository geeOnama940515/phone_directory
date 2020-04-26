import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:phone_directory/PreviousExecutiveMembers.dart';
import 'package:phone_directory/UpdatePreviousExecutive.dart';
import 'package:phone_directory/models/Post.dart';

class PreviousExecutive extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PreviousExecutiveState();
  }
}

class PreviousExecutiveState extends State<PreviousExecutive>{

  final response = FirebaseDatabase.instance.reference().child('previousExecutive');
  List<Post> listItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Office Bearers'),
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
                    listItems.add(Post(post: key,priority: value['priority']));
                  });
                }
                listItems.sort((a,b)=>a.priority.compareTo(b.priority));
//                print(listItems);
//                print(listItems.length);
//                listItems.forEach((element) {print(element.priority);});
//                listItems.sort((a, b) => a.priority.compareTo(b.priority));
//                print(listItems);
//                print(listItems.length);
                return ListView.builder(
                    itemCount: listItems.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text(
                              listItems[index].post,
                              style: TextStyle(color: Colors.indigo),
                            ),
                            trailing: popupMenu(listItems[index]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PreviousExecutiveMembers(
                                        post : listItems[index].post,
                                      )));
                            },
//                            subtitle: Text(
//                              listItems[index].name,
//                              style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
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

  Widget popupMenu(post) {
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
        (value == 1) ? update(post) : delete(post);
      },
      icon: Icon(Icons.more_vert),
    );
  }

  void update(post) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => UpdatePreviousExecutive(post: post,)))
        .then((value) {
      setState(() {});
    });
  }

  void delete(post) {
    FirebaseDatabase.instance
        .reference()
        .child('previousexecutive')
        .child(post)
        .remove();
    setState(() {});
  }
}