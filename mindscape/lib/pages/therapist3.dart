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
      home: Therapist3ProfilePage(),
    );
  }
}

class Therapist3ProfilePage extends StatelessWidget {
  // LinkedIn URL
  final String linkedInUrl =
      'https://in.linkedin.com/in/sanya-taneja-16497b1a9'; // Replace with your LinkedIn profile URL

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
                      'assets/images/therapist3.png', // Replace with your image path
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
                    'Sanya Taneja',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Therapist • 3+ years of experience',
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
                    'Navigate Life\'s Challenges Together \n\nMeet Sanya Taneja, a compassionate psychologist with a focus on adolescent and career challenges, stress, and low self-esteem. With 3 years of experience, Sanya is a certified expert in Rational Emotive Cognitive Behaviour Therapy (RECBT) and Career Guidance. \n',
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Embark on a transformative journey of self-discovery with personalised guidance. Break free from the constraints of stress and depression - let Sanya be your guide to a brighter tomorrow! \n\n',
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.assignment, color: Colors.grey),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Family Issues | Learning Disability | Anxiety \n | Couple Issues',
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
