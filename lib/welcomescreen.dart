import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(211, 241, 105, 1.0),
        child: Center(
          // Column to display image, text, and buttons
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace 'assets/welcome_image.png' with the actual path to your welcome image
              Image.asset('assets/images/7.png', width: 200, height: 200),
              SizedBox(height: 20), // Add spacing between image and text
              Text(
                'Welcome back',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40), // Add spacing between text and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle signup button press
                    },
                    child: Text('Sign Up'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle login button press
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
