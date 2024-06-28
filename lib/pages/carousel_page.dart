import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselPage extends StatelessWidget {
  final List<String> images = [
    'assets/image1.png', // Add your image paths
    'assets/image2.png',
    'assets/image3.png',
  ];

  final List<String> texts = [
    "Light up ur day with a cup of coffee",
    "Enjoy our freshly brewed coffee",
    "Start your morning with us"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (context, index, realIndex) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(images[index], fit: BoxFit.cover),
              Positioned(
                top: 16.0,
                left: 16.0,
                child: Container(
                  color: Colors.black54, // Optional: To add a dark background to the text
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    texts[index],
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
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
        ),
      ),
    );
  }
}
