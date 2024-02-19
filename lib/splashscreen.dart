import 'package:flutter/material.dart';
import 'welcomescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization code here if needed

    // Example: Navigate to the welcome screen after 2 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context!,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(211, 241, 105, 1.0),
        child: Center(
          // Column to display both the image and text
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace 'assets/your_logo.png' with the actual path to your logo image
              Image.asset('assets/images/7.png', width: 200, height: 200),
              SizedBox(height: 20), // Add spacing between image and text
              Text(
                'Hostel Management \nMade Easy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


