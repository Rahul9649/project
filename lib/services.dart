

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class ServiceOption extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onPressed;

  ServiceOption({
    required this.title,
    required this.description,
    required this.icon,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _navigateToOption(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          leading: Icon(icon, color: Colors.black),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(description),
        ),
      ),
    );
  }

  void _navigateToOption(BuildContext context) {
    switch (title) {
      case 'Notice Board':
        _navigateWithFade(context, NoticeBoardScreen());
        break;
      case 'Maintenance':
        _navigateWithScale(context, MaintenanceScreen());
        break;
      case 'Laundry':
        _navigateWithRotate(context, LaundryScreen());
        break;
      case 'Leave Request':
        _navigateWithSlide(context, LeaveRequestScreen());
        break;
      case 'Fee Payment':
        _navigateWithSize(context, FeePaymentScreen());
        break;
    }
  }

  void _navigateWithFade(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.easeInOut;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var fadeAnimation = animation.drive(tween);
          return FadeTransition(opacity: fadeAnimation, child: child);
        },
      ),
    );
  }

  void _navigateWithScale(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.easeInOut;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var scaleAnimation = animation.drive(tween);
          return ScaleTransition(scale: scaleAnimation, child: child);
        },
      ),
    );
  }

  void _navigateWithRotate(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.easeInOut;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var rotateAnimation = animation.drive(tween);
          return RotationTransition(turns: rotateAnimation, child: child);
        },
      ),
    );
  }

  void _navigateWithSlide(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset(0.0, 0.0);
          const curve = Curves.easeInOut;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var slideAnimation = animation.drive(tween);
          return SlideTransition(position: slideAnimation, child: child);
        },
      ),
    );
  }

  void _navigateWithSize(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.easeInOut;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var sizeAnimation = animation.drive(tween);
          return SizeTransition(sizeFactor: sizeAnimation, child: child);
        },
      ),
    );
  }
}

class NoticeBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notice Board')),
      body: Center(child: Text('Notice Board Screen')),
    );
  }
}
class MaintenanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maintenance Request'),
        foregroundColor: Colors.black,
        backgroundColor: Color.fromRGBO(211, 241, 105, 1.0),
      ),
      body: MaintenanceForm(),
    );
  }
}

class MaintenanceForm extends StatefulWidget {
  @override
  _MaintenanceFormState createState() => _MaintenanceFormState();
}

class _MaintenanceFormState extends State<MaintenanceForm> {
  late TextEditingController notesController;
  XFile? _image;

  @override
  void initState() {
    super.initState();
    notesController = TextEditingController();
  }

  Future<void> _getImage() async {
    try {
      final picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _image = pickedFile;
        });
      }
    } catch (e) {
      // Handle exceptions, such as the plugin not being available on the current platform
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Submit a Maintenance Request',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              backgroundColor: Color.fromRGBO(211, 241, 105, 1.0),
            ),
          ),
          SizedBox(height: 20),
          Text('Select the type of maintenance:'),
          DropdownButton<String>(
            items: ['Plumbing', 'Electrical', 'Others']
                .map((String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ))
                .toList(),
            onChanged: (String? value) {
              // Handle the selected maintenance type
            },
            hint: Text('Select Maintenance Type'),
            isExpanded: true,
            style: TextStyle(
              color: Colors.black,
            ),
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Text('Upload Photographs of the Issue:'),
          ElevatedButton.icon(
            onPressed: _getImage,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(211, 241, 105, 1.0),
            ),
            icon: Icon(Icons.camera_alt),
            label: Text(
              'Upload Image',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20),
          _image != null
              ? Card(
            elevation: 5,
            child: Image.file(
              File(_image!.path),
              height: 100,
              fit: BoxFit.cover,
            ),
          )
              : Container(),
          SizedBox(height: 20),
          Text('Additional Notes:'),
          TextFormField(
            controller: notesController,
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter additional notes here...',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle form submission with _image and notesController.text
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(211, 241, 105, 1.0),
            ),
            child: Text(
              'Submit Request',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LaundryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Laundry')),
      body: Center(child: Text('Laundry Screen')),
    );
  }
}

class LeaveRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leave Request')),
      body: Center(child: Text('Leave Request Screen')),
    );
  }
}

class FeePaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fee Payment')),
      body: Center(child: Text('Fee Payment Screen')),
    );
  }
}

class ServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
        foregroundColor: Colors.black,
        backgroundColor: Color.fromRGBO(211, 241, 105, 1.0),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Handle the menu button press
              // You can show a drawer or navigate to a menu screen
            },
          ),
        ],
      ),
      body: Container(
        color: Color.fromRGBO(246, 246, 238, 1.0),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ServiceOption(
              title: 'Notice Board',
              description: 'Stay updated with important notices.',
              icon: Icons.notifications,
              backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoticeBoardScreen()),
                );
              },
            ),
            ServiceOption(
              title: 'Maintenance',
              description: 'Submit and track maintenance requests.',
              icon: Icons.build,
              backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MaintenanceScreen()),
                );
              },
            ),
            ServiceOption(
              title: 'Laundry',
              description: 'Schedule and manage laundry services.',
              icon: Icons.local_laundry_service,
              backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LaundryScreen()),
                );
              },
            ),
            ServiceOption(
              title: 'Leave Request',
              description: 'Submit leave requests and view status.',
              icon: Icons.calendar_today,
              backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaveRequestScreen()),
                );
              },
            ),
            ServiceOption(
              title: 'Fee Payment',
              description: 'View and pay hostel fees securely.',
              icon: Icons.payment,
              backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeePaymentScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
