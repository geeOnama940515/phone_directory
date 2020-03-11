import 'package:flutter/material.dart';
import 'package:phone_directory/ContactsDisplay.dart';

class SectorsDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: getSectorView());
  }
}

List<String> getSectorElements() {
  var items = List<String>.generate(50, (counter) => "Sector : ${counter + 1}");
  return items;
}

Widget getSectorView() {
  var listItems = getSectorElements();
  var listView = ListView.builder(
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
              thickness: 2.0,
              indent: 40.0,
              endIndent: 40.0,
            )
          ],
        );
      });
  return listView;
}
