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
      home: Therapist5ProfilePage(),
    );
  }
}

class Therapist5ProfilePage extends StatelessWidget {
  // LinkedIn URL
  final String linkedInUrl =
      'https://in.linkedin.com/in/pushpapsychologist'; // Replace with the actual LinkedIn profile URL

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
                      'assets/images/therapist5.png', // Replace with your image path
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
                    'Dr. Pushpa Ragaveni',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Therapist • 16+ years of experience',
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
                    'Meet Dr. Pushpa Ragaveni, a seasoned clinical psychologist with a 16-year tenure.\n\nHolding a master\'s degree and a P.G. certificate in counseling psychology, along with a Doctorate in Law of Attraction, Holistic Wellness, and Emotional Coaching. Beyond individual practice, she offers diverse training sessions for organizations, specializing in psychotherapy, cognitive behavior therapy, and more.\n',
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Begin your journey to benefit from her vast expertise in mental health, addressing concerns such as sexual issues, everyday stress, and relationships & dating.\n',
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.assignment, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'Sexual Issues | Everyday Stress | \nRelationships & Dating',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.language, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'Hindi | English | Punjabi',
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
