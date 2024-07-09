import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'feel_happy.dart';
import 'embrace_morning.dart';
import 'power_learning.dart';
import 'success.dart';

class ImproveHealth extends StatefulWidget {
  const ImproveHealth({Key? key}) : super(key: key);

  @override
  _ImproveHealthState createState() => _ImproveHealthState();
}

class _ImproveHealthState extends State<ImproveHealth> {
  int currentIndex = 0;
  ScreenshotController screenshotController = ScreenshotController();

  List<String> texts = [
    "I prioritize my health and well-being",
    "I am grateful for my body and all that it does for me",
    "I nourish my body with healthy and nutritious foods",
    "I make time for regular exercise and physical activity",
    "I prioritize getting enough restful sleep every night",
    "I listen to my body and give it the rest it needs when necessary",
    "I am mindful of my stress levels and manage it effectively",
  ];

  List<Color> pastelColors = [
    Colors.blue[200]!,
    Colors.green[200]!,
    Colors.orange[200]!,
    Colors.pink[200]!,
    Colors.purple[200]!,
    Colors.teal[200]!,
    Colors.yellow[200]!,
  ];

  List<String> buttonTitles = [
    'Feel Happy',
    'Improve Health',
    'Embrace Morning',
    'Powerful Learning',
    'Abundant Success',
  ];

  // Filter out the current page's title
  List<String> get filteredButtonTitles =>
      buttonTitles.where((title) => title != 'Improve Health').toList();

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
          'Improve Health',
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
                itemCount: filteredButtonTitles.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to corresponding page
                        switch (index) {
                          case 0: // Feel Happy
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeelHappy()),
                            );
                            break;
                          case 1: // Embrace Morning
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmbraceMorning()),
                            );
                            break;
                          case 2: // Powerful Learning
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PowerfulLearning()),
                            );
                            break;
                          case 3: // Abundant Success
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AbundantSuccess()),
                            );
                            break;
                          default:
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
                      child: Text(filteredButtonTitles[index]),
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
    home: ImproveHealth(),
  ));
}
