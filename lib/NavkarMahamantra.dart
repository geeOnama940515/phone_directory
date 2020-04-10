import 'package:flutter/material.dart';
import 'package:phone_directory/ImagesMandir.dart';

class NavkarMahamantra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage('assets/mantra.jpeg'),
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ImagesMandir()));
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.black45,
                  ),
                  margin: EdgeInsets.only(top: 30.0, right: 20.0),
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Next Page',
                    style: TextStyle(color: Colors.white,fontSize: 17.0),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
