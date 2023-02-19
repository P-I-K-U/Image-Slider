import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0; // counter for knowing current slide

  final List<String> images = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
    "assets/images/img5.jpg",
    "assets/images/img6.jpg"
  ];

  final List<String> places = [
    "INDIA",
    "AMERICA",
    "AFRICA",
    "EUROPE",
    "ASIA",
    "SHRI LANKA"
  ];

  //create function and its return a widget in the form of list for items in carousel Slider
  List<Widget> generateImageTiles() {
    return images
        .map((elements) => ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                elements,
                fit: BoxFit.cover,
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      color: Colors.white,
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Stack(
          //we can use stack because of overlapping of text over the images
          children: [
            CarouselSlider(
                items: generateImageTiles(),
                options: CarouselOptions(enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 15/10,
                onPageChanged: (index,other){
                  setState(() {
                    _current = index;
                  });
                }),),

            AspectRatio(aspectRatio: 15/10,
            child: Center(
              child: Text(
                places[_current],
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width/15,

                ),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
