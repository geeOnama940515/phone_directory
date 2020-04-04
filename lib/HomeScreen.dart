import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phone_directory/ExecutiveBoard.dart';
import 'package:phone_directory/Patrons.dart';
import 'package:phone_directory/SectorsDisplay.dart';
import 'package:phone_directory/TempleDisplay.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              color: Colors.deepOrangeAccent,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
            ListTile(
              title: Text('Jain mandir in Faridabad'),
              leading: Icon(Icons.location_on),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TempleDisplay()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Executie Body'),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ExecutiveBoard()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Patrons'),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Patrons()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('PhoneBook(Male)'),
              leading: Icon(Icons.call),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SectorsDisplay(
                              part: '1',
                            )));
              },
            ),
            Divider(),
            ListTile(
              title: Text('PhoneBook(Female)'),
              leading: Icon(Icons.call),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SectorsDisplay(
                              part: '2',
                            )));
              },
            ),
            Divider(),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Color(0xffffcc00)],
                //ffcc00 Color(0xffffb6b6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.25, 1.0])),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => TempleDisplay()));
                },
                height: MediaQuery.of(context).size.height * 0.065,
                color: Color(0xffb21f66),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                        child: Text(
                      'Jain Mandir in Faridabad',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ExecutiveBoard()));
                },
                height: MediaQuery.of(context).size.height * 0.065,
                color: Color(0xffb21f66),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                        child: Text(
                      'Executive Body',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Patrons()));
                },
                height: MediaQuery.of(context).size.height * 0.065,
                color: Color(0xffb21f66),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                        child: Text(
                      'Patrons',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SectorsDisplay(
                                part: '1',
                              )));
                },
                height: MediaQuery.of(context).size.height * 0.065,
                color: Color(0xffb21f66),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                        child: Text(
                      'Phonebook(Male)',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SectorsDisplay(part: '2')));
                },
                height: MediaQuery.of(context).size.height * 0.065,
                color: Color(0xffb21f66),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                        child: Text(
                      'Phonebook(Female)',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
