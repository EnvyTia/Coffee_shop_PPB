import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.05),
        child: Column(
          children: [
            Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: height * 0.03, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 0.05),
            // Add your home page content here
            // For example, a list of coffee items or a menu
            for (var i = 0; i < 20; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Card(
                  child: ListTile(
                    title: Text('Item $i'),
                    subtitle: Text('Description of item $i'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
