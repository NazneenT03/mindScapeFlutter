import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'self_care.dart';
import 'feel_happy.dart';
import 'improve_health.dart';
import 'embrace_morning.dart';
import 'power_learning.dart';

class AbundantSuccess extends StatefulWidget {
  const AbundantSuccess({Key? key}) : super(key: key);

  @override
  _AbundantSuccessState createState() => _AbundantSuccessState();
}

class _AbundantSuccessState extends State<AbundantSuccess> {
  int currentIndex = 0;
  ScreenshotController screenshotController = ScreenshotController();

  List<String> texts = [
    "I am deserving of abundant success and happiness",
    "I am capable of achieving anything I set my mind to",
    "I am open and receptive to opportunities for success",
    "I am confident in my ability to overcome challenges and obstacles",
    "I embrace a positive and optimistic mindset in all aspects of my life",
    "I am grateful for the blessings and abundance in my life",
    "I trust the universe to guide me towards success and fulfillment",
    "I am willing to take calculated risks to achieve my goals",
    "I am disciplined and focused on my goals, even in the face of distractions or setbacks",
    "I believe in my own strengths and abilities to succeed",
    "I am surrounded by supportive and encouraging people",
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
          'Abundant Success',
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SelfCare()),
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
                    child: Text('Self Care'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeelHappy()),
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
                    child: Text('Feel Happy'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImproveHealth()),
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
                    child: Text('Improve Health'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmbraceMorning()),
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
                    child: Text('Embrace Morning'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PowerfulLearning()),
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
                    child: Text('Powerful Learning'),
                  ),
                ],
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
    home: AbundantSuccess(),
  ));
}
