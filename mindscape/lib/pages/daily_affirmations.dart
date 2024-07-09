import 'package:flutter/material.dart';
import 'self_care.dart';
import 'feel_happy.dart';
import 'improve_health.dart';
import 'embrace_morning.dart';
import 'power_learning.dart';
import 'success.dart';

class DailyAffirm extends StatelessWidget {
  final List<String> leftSideContent = [
    'Self Care',
    'Feel Happy',
    'Improve Health',
    'Embrace Morning',
    'Powerful Learning',
    'Abundant Success',
  ];

  final List<String> leftSideSubContent = [
    'Enhance your mental & physical energy levels',
    'Find positive emotions every day',
    'Learn to live more mindfully',
    'Wake up energized & full of positivity',
    'Attract your dreams intently',
    'Achieve success in abundance',
  ];

  final List<String> assetPaths = [
    'assets/images/self_care.png',
    'assets/images/feel_happy.png',
    'assets/images/improve_health.png',
    'assets/images/embrace_morning.png',
    'assets/images/powerful_learning.png',
    'assets/images/abundant_success.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Affirmations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: leftSideContent.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelfCare()),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeelHappy()),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImproveHealth()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmbraceMorning()),
                    );
                    break;
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PowerfulLearning()),
                    );
                    break;
                  case 5:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AbundantSuccess()),
                    );
                    break;
                }
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
    home: DailyAffirm(),
  ));
}
