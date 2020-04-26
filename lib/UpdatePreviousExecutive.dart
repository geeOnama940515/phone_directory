import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:phone_directory/models/Post.dart';

class UpdatePreviousExecutive extends StatefulWidget {
  Post post;

  UpdatePreviousExecutive({this.post});

  @override
  State<StatefulWidget> createState() {
    return UpdatePreviousExecutiveState();
  }
}

class UpdatePreviousExecutiveState extends State<UpdatePreviousExecutive> {
  String newPost, newPriority;
  TextEditingController postController, priorityController;

  @override
  void initState() {
    super.initState();

    newPost=widget.post.post;
    newPriority=widget.post.priority.toString();

    priorityController =
        TextEditingController(text: widget.post.priority.toString());
    postController = TextEditingController(text: widget.post.post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.post.post == newPost) {
            FirebaseDatabase.instance
                .reference()
                .child('previousExecutive')
                .child(newPost)
                .update({'priority': int.parse(newPriority)});
          }
          else{
            FirebaseDatabase.instance
                .reference()
                .child('previousExecutive')
                .child(widget.post.post)
                .once()
                .then((DataSnapshot snapshot) {
              var data = snapshot.value;
              FirebaseDatabase.instance
                  .reference()
                  .child('previousExecutive')
                  .child(newPost)
                  .set(data);
              FirebaseDatabase.instance
                  .reference()
                  .child('previousExecutive')
                  .child(newPost)
                  .update({'priority': int.parse(newPriority)});
              FirebaseDatabase.instance
                  .reference()
                  .child('previousExecutive')
                  .child(widget.post.post)
                  .remove();
            });
          }
          Navigator.pop(context, true);
        },
        child: Icon(
          Icons.keyboard_arrow_right,
          size: 40.0,
        ),
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Update Post Name'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30.0, left: 12.0, right: 12.0),
            child: TextFormField(
              autofocus: true,
              onChanged: (value) {
                newPost = value;
              },
              keyboardType: TextInputType.text,
              controller: postController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0))),
                hintText: "Post Name",
                hintStyle: TextStyle(fontSize: 20.0),
                labelStyle:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                labelText: "Enter New Post Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0))),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0, left: 12.0, right: 12.0),
            child: TextFormField(
              autofocus: true,
              onChanged: (value) {
                newPriority = value;
              },
              keyboardType: TextInputType.number,
              controller: priorityController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0))),
                hintText: "Priority",
                hintStyle: TextStyle(fontSize: 20.0),
                labelStyle:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                labelText: "Enter New Priority",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
