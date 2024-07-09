import 'package:flutter/material.dart';
import 'package:mindscape/pages/mindful_breathing.dart';
import 'package:mindscape/pages/micro_reads.dart';
import 'package:mindscape/pages/daily_affirmations.dart';
import 'package:mindscape/pages/talk_to_expert.dart';

class HomeScreen extends StatelessWidget {
  final List<String> leftSideContent = [
    'Mindful Breathing',
    'Micro Reads',
    'Daily Affirmations',
    'Wellness Coaching',
  ];

  final List<String> leftSideSubContent = [
    'Find simple guided exercises to bring peace and calmness to your mind',
    'Gain deeper understanding of your mind to expand your awareness and share wisdom',
    'Empower yourself with positive affirmations and break away from any negative thinking habits you may have',
    'Talk with a Coach to create a goal-oriented, and meaningful lifestyle for enhanced well-being',
  ];

  final List<String> assetPaths = [
    'assets/images/breathing.png',
    'assets/images/reads.png',
    'assets/images/affirmations.png',
    'assets/images/coach.png',
  ];

  final List<Widget> routes = [
    MindfulBreathing(),
    SwipeExample(),
    DailyAffirm(),
    ExpertListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: leftSideContent.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => routes[index]),
                );
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              leftSideContent[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              leftSideSubContent[index],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                          image: DecorationImage(
                            image: AssetImage(assetPaths[index]),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
