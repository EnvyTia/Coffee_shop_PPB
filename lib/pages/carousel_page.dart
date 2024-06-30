import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final List<String> images = [
    'assets/image1.png', // Add your image paths
    'assets/image2.png',
    'assets/image3.png',
  ];

  final List<String> texts = [
    "Light up your day with a cup of coffee",
    "Enjoy our freshly brewed coffee",
    "Start your morning with us"
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.5), // Dark shade overlay
                  ),
                  Positioned(
                    top: 50.0,
                    left: 20.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      child: Text(
                        texts[index],
                        style: TextStyle(
                          fontSize: 42,
                          color: Colors.white,
                          fontFamily: 'Itim',
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              );
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              viewportFraction: 1.0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Positioned(
            top: 40.0,
            right: 16.0,
            child: IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.white, size: 30.0),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: MediaQuery.of(context).size.width / 2 - (images.length * 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((image) {
                int index = images.indexOf(image);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.white : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
