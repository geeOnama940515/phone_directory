import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:phone_directory/NavkarMahamantra.dart';

final List<String> imgList = [
//  'https://i.imgur.com/4jwIsg2.jpg',
  'https://i.imgur.com/YLqwJxc.jpg',
  'https://i.imgur.com/P4Mda2Z.jpg',
  'https://i.imgur.com/fLMgAey.jpg',
  'https://i.imgur.com/ZPKjvd4.jpg',
  'https://i.imgur.com/EkhPqWo.jpg',
  'https://i.imgur.com/5nhB8Fv.jpg',
  'https://i.imgur.com/oiCrRMR.jpg',
  'https://i.imgur.com/XAeBmLP.jpg'
];

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(
              i,
              fit: BoxFit.cover,
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

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Non-looping manual Carousel
    final CarouselSlider nonLoopingCarousel = CarouselSlider(
        autoPlayInterval: Duration(seconds: 3),
        items: child,
        height: MediaQuery.of(context).size.height,
        scrollPhysics: BouncingScrollPhysics(),
        autoPlay: true,
        pauseAutoPlayOnTouch: Duration(seconds: 6),
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: MediaQuery.of(context).size.aspectRatio);

    return Scaffold(
      backgroundColor: Color(0xffffb53c),
      body: Stack(
        children: <Widget>[
          nonLoopingCarousel,
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NavkarMahamantra()));
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.black45,
                  ),
                  margin: EdgeInsets.only(right: 20.0, top: 30.0),
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Skip ad',
                    style: TextStyle(color: Colors.white,fontSize: 17.0),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
