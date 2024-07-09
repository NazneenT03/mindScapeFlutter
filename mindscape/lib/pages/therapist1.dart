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
      home: Therapist1ProfilePage(),
    );
  }
}

class Therapist1ProfilePage extends StatelessWidget {
  final String linkedInUrl =
      'https://www.linkedin.com/in/madhumita-bhattacharya';

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
                      'assets/images/therapist1.png', // Replace with your image path
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
                    'Madhumita Bhattacharya',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Therapist • 11+ years of experience',
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
                    'Madhumita is a passionate mental health practitioner who is deeply inclined towards ethical mental health care practices. With over 11 years of experience, she specializes in counseling clients from diverse backgrounds, nationalities, and cultural outlooks. Her expertise extends to delivering successful workshops, seminars, webinars, and awareness programs on the subjects of mental health and emotional wellbeing within educational institutions, corporate settings, and other arenas.',
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Madhumita\'s dedication to her field is exemplified by her affiliations with esteemed organizations such as Maven Clinic in the USA and ORDI (Organization for Rare Diseases India). Her holistic approach to mental health shines through in her commitment to providing compassionate and effective care.',
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.assignment, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'Depression | Anxiety | Sleep Deprivation',
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
                        'Hindi | English | Bengali',
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
