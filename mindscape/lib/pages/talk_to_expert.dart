import 'package:flutter/material.dart';
import 'therapist1.dart';
import 'therapist2.dart';
import 'therapist3.dart';
import 'therapist4.dart';
import 'therapist5.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpertListPage(),
    );
  }
}

class ExpertListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade100,
        title: Text('Talk to an Expert'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.warning),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.pinkAccent.shade100,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Experts for you',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            ExpertCard(
              name: 'Madhumita Bhattacharya',
              experience: '11+ Years of Experience',
              imagePath: 'assets/images/therapist1.png',
              specialties: 'Depression | Anxiety | Sleep Deprivation',
              languages: 'Hindi | English | Bengali',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Therapist1ProfilePage(),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            ExpertCard(
              name: 'Harsh Pandya',
              experience: '6+ Years of Experience',
              imagePath: 'assets/images/therapist2.png',
              specialties:
                  'Identity Issues | Sexual Issues | Crisis Intervention | Marital Problems',
              languages: 'Hindi | English | Marathi | Gujarati',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Therapist2ProfilePage(),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            ExpertCard(
              name: 'Sanya Taneja',
              experience: '3+ Years of Experience',
              imagePath: 'assets/images/therapist3.png',
              specialties:
                  'Family Issues | Learning Disabilities | Anxiety | Couple Issues',
              languages: 'Hindi | English | Punjabi',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Therapist3ProfilePage(),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            ExpertCard(
              name: 'Moksha Shah',
              experience: '4+ Years of Experience',
              imagePath: 'assets/images/therapist4.png',
              specialties: 'Career Growth | Depression | Anxiety',
              languages: 'Hindi | English | Marathi | Gujarati',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Therapist4ProfilePage(),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            ExpertCard(
              name: 'Dr. Pushpa Ragaveni',
              experience: '16+ Years of Experience',
              imagePath: 'assets/images/therapist5.png',
              specialties:
                  'Sexual Issues | Everyday Stress | Relationships and Dating',
              languages: 'English | Telugu',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Therapist5ProfilePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ExpertCard extends StatelessWidget {
  final String name;
  final String experience;
  final String imagePath;
  final String specialties;
  final String languages;
  final Function onTap;

  ExpertCard({
    required this.name,
    required this.experience,
    required this.imagePath,
    required this.specialties,
    required this.languages,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          imagePath,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          color: Colors.black54,
                          child: Center(
                            child: Text(
                              'View Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(experience),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.assignment, color: Colors.grey),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                specialties,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.language, color: Colors.grey),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                languages,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
