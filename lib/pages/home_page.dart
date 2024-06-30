import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/sbuc.jpg'), // Update with your background image path
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5), // Dark shade over the image
              ),
            ),
          ),
          Column(
            children: [
              // User Profile Section
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
                color: Colors.grey[200],
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/user_profile.jpg'), // Add your user profile image here
                    ),
                    SizedBox(width: width * 0.05),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Nokotan!!',
                          style: TextStyle(fontSize: height * 0.03, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Points: 24500',
                          style: TextStyle(fontSize: height * 0.02, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Promotional Products Section
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
                  child: Column(
                    children: [
                      PromoCard(
                        imageUrl: 'assets/dalgona_coffee.jpeg', // Add your promotional product image here
                        title: 'Dalgona Coffee',
                        description:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
                      ),
                      PromoCard(
                        imageUrl: 'assets/cake_coffee.jpg', // Add your promotional product image here
                        title: 'Cake n Coffee',
                        description:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      ),
                      PromoCard(
                        imageUrl: 'assets/cake_coffee.jpg', // Add your promotional product image here
                        title: 'Cake n Coffee',
                        description:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      ),
                      // Add more PromoCards here if needed
                    ],
                  ),
                ),
              ),
              // Bottom Navigation Buttons
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, size: height * 0.04),
                      onPressed: () {
                        // Add your navigation logic here
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.list, size: height * 0.04),
                      onPressed: () {
                        // Add your navigation logic here
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  PromoCard({required this.imageUrl, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: width * 0.8, // Ratio 3:5 for card
        child: Row(
          children: [
            Container(
              width: width * 0.5, // Half of the card width
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      description,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
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
