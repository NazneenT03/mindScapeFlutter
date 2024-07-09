import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'feel_happy.dart';
import 'improve_health.dart';
import 'power_learning.dart';
import 'success.dart';

class EmbraceMorning extends StatefulWidget {
  const EmbraceMorning({Key? key}) : super(key: key);

  @override
  _EmbraceMorningState createState() => _EmbraceMorningState();
}

class _EmbraceMorningState extends State<EmbraceMorning> {
  int currentIndex = 0;
  ScreenshotController screenshotController = ScreenshotController();

  List<String> texts = [
    "I wake up feeling refreshed and energized",
    "I am excited to start a new day full of opportunities",
    "I am grateful for this new day and all the possibilities it holds",
    "I am capable of achieving anything I set my mind to today",
    "I welcome each day with a positive and optimistic mindset",
    "I am worthy of all the good things that come my way today",
    "I am open and receptive to new experiences and opportunities",
    "I choose to let go of any negative thoughts or worries from yesterday",
    "I am grateful for the blessings in my life and the people who support me",
    "I am starting the day with calmness and clarity",
    "I am focused and productive throughout the day",
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

  // Titles of other pages excluding Embrace Morning
  List<String> buttonTitles = [
    'Feel Happy',
    'Improve Health',
    'Powerful Learning',
    'Abundant Success',
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
          'Embrace Morning',
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
                itemCount: buttonTitles.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement button functionality here
                        switch (index) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeelHappy()),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ImproveHealth()),
                            );
                            break;
                          case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PowerfulLearning()),
                            );
                            break;
                          case 3:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AbundantSuccess()),
                            );
                            break;
                        }
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
                      child: Text(buttonTitles[index]),
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
    home: EmbraceMorning(),
  ));
}
