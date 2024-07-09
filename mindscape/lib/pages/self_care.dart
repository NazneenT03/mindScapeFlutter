import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'feel_happy.dart';
import 'improve_health.dart';
import 'embrace_morning.dart';
import 'power_learning.dart';
import 'success.dart';

class SelfCare extends StatefulWidget {
  const SelfCare({Key? key}) : super(key: key);

  @override
  _SelfCareState createState() => _SelfCareState();
}

class _SelfCareState extends State<SelfCare> {
  int currentIndex = 0;
  ScreenshotController screenshotController = ScreenshotController();

  List<String> texts = [
    "I am worthy of taking care of myself",
    "I choose to prioritize my physical, mental, and emotional well-being",
    "I deserve to feel refreshed and rejuvenated",
    "I am grateful for the moments of rest and relaxation in my life",
    "I am capable of setting boundaries that honor my needs",
    "I am deserving of love and care from myself",
    "I choose to make self-care a daily priority",
    "I am capable of identifying my needs and addressing them",
    "I am worthy of taking breaks and time off when I need it",
    "I am confident in my ability to make decisions about my well-being",
    "I am capable of finding solutions to any problems that arise",
  ];

  List<Color> pastelColors = [
    Colors.blue[200]!,
    Colors.green[200]!,
    Colors.orange[200]!,
    Colors.pink[200]!,
    Colors.purple[200]!,
    Colors.teal[200]!,
    Colors.yellow[200]!,
    Colors.red[200]!,
    Colors.cyan[200]!,
    Colors.amber[200]!,
    Colors.indigo[200]!,
  ];

  // Set a fixed background color for the Scaffold and AppBar
  Color backgroundColor = Color(0xFFFFF9C4); // Very pale pastel yellow color

  Future<void> shareCardAsImage(int index) async {
    final directory = await getTemporaryDirectory();
    String fileName = '${directory.path}/card_image.png';

    screenshotController
        .captureFromWidget(
      Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: pastelColors[index],
            ),
            padding: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '“',
                  style: TextStyle(
                    fontSize: 120,
                    fontFamily: 'SpaceGrotesk',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  texts[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'SpaceGrotesk',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Image.asset(
              'assets/images/mindscape-high-resolution-logo-transparent.png',
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    )
        .then((capturedImage) async {
      final file = File(fileName);
      await file.writeAsBytes(capturedImage);
      Share.shareXFiles([XFile(file.path)],
          text: 'Check out this inspirational message!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Self Care',
          style: TextStyle(
            fontSize: 29,
            fontFamily: 'PlaywriteNZ',
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 650,
              child: CardSwiper(
                cardsCount: texts.length,
                cardBuilder: (context, index, x, y) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: pastelColors[index],
                    ),
                    padding: EdgeInsets.all(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '“',
                          style: TextStyle(
                            fontSize: 120,
                            fontFamily: 'SpaceGrotesk',
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          texts[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'SpaceGrotesk',
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.bookmark),
                              onPressed: () {
                                // Implement bookmark functionality if needed
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.share),
                              onPressed: () {
                                print(
                                    "Share button pressed for: ${texts[index]}"); // Debug message
                                shareCardAsImage(index);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                onSwipe: (previous, current, direction) {
                  currentIndex = current!;
                  setState(() {});
                  return true;
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10), // Add a small bottom margin
            alignment: Alignment.center,
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Change to 5 to match the number of pages
                itemBuilder: (context, index) {
                  final titles = [
                    'Feel Happy',
                    'Improve Health',
                    'Embrace Morning',
                    'Powerful Learning',
                    'Abundant Success'
                  ];

                  final pages = [
                    FeelHappy(),
                    ImproveHealth(),
                    EmbraceMorning(),
                    PowerfulLearning(),
                    AbundantSuccess(),
                  ];

                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pages[index]),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12, // Adjust vertical padding as needed
                        ),
                      ),
                      child: Text(titles[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SelfCare(),
  ));
}
