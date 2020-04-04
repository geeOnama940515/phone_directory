import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:phone_directory/HomeScreen.dart';

final List<String> imgList = [
  'https://i.imgur.com/k1Dz5hh.jpg',
  'https://i.imgur.com/bFkdioP.jpg',
  'https://i.imgur.com/4IllhhH.jpg'
];

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(
              i,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            )));
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class ImagesMandir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CarouselSlider nonLoopingCarousel = CarouselSlider(
      autoPlayInterval: Duration(seconds: 3),
      items: child,
      scrollPhysics: BouncingScrollPhysics(),
      enableInfiniteScroll: true,
      autoPlay: true,
      height: MediaQuery.of(context).size.height,
      pauseAutoPlayOnTouch: Duration(seconds: 6),
      enlargeCenterPage: true,
      viewportFraction: 1.0,
      aspectRatio: 2.0,
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          nonLoopingCarousel,
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()));
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.black45,
                  ),
                  margin: EdgeInsets.only(right: 10.0, top: 20.0),
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
