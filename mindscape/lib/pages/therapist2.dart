import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Therapist2ProfilePage(),
    );
  }
}

class Therapist2ProfilePage extends StatelessWidget {
  // LinkedIn URL
  final String linkedInUrl =
      'https://in.linkedin.com/in/psychologist-harsh-pandya-5859ab29a'; // Replace with your LinkedIn profile URL

  // Function to launch LinkedIn URL
  Future<void> _launchLinkedIn() async {
    if (await canLaunch(linkedInUrl)) {
      await launch(linkedInUrl);
    } else {
      throw 'Could not launch $linkedInUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    child: Image.asset(
                      'assets/images/therapist2.png', // Replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                        // Add navigation back action
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Harsh Pandya',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Therapist • 6+ years of experience',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Overcoming Mental Health Challenges with Harsh Pandya. \n\nHarsh Pandya, an experienced therapist with 6 years in the field, has helped over 700 clients positively overcome mental health problems, Harsh specialises in a wide range of issues, from Adolescent Problems to Trauma & Healing. \n',
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Your journey to mental well-being starts here trust Harsh Pandya to help you unlock your true potential. \n\n',
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.assignment, color: Colors.grey),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Identity Issues | Sexual Issues | Crisis \nIntervention | Marital Problems',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.language, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'Hindi | English | Marathi | Gujarati',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.videocam, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'Virtual',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.link, color: Colors.grey),
                      SizedBox(width: 4),
                      GestureDetector(
                        onTap: () async {
                          if (await canLaunch(linkedInUrl)) {
                            await launch(linkedInUrl);
                          } else {
                            throw 'Could not launch $linkedInUrl';
                          }
                        },
                        child: Text(
                          'Connect on LinkedIn',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
