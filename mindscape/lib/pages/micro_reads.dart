import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'self_doubt.dart'; // Import the new page
import 'depression.dart'; // Import the depression page
import 'therapy.dart'; // Assuming TherapyPage is defined in therapy.dart
import 'min_reads_1.dart'; // Import the MinReadsPage or appropriate class
import 'min_reads_2.dart'; // Import the MinReads2Page or appropriate class

class SwipeExample extends StatefulWidget {
  const SwipeExample({super.key});

  @override
  State<SwipeExample> createState() => _SwipeExampleState();
}

class _SwipeExampleState extends State<SwipeExample> {
  List<String> texts = [
    "Overcoming Self-Doubt and Embracing Positivity",
    "Recognizing Symptoms When Sadness Turns into Depression",
    "Getting Started with Therapy - The First Step",
  ];

  // List of image paths
  List<String> images = [
    'assets/images/self_doubt.png',
    'assets/images/depression.png',
    'assets/images/therapy.png',
  ];

  // Pastel colors for the cards
  List<Color> pastelColors = [
    Color(0xFFFFF0F5), // Lavender Blush
    Color(0xFFFFE4E1), // Misty Rose
    Color(0xFFFFF5EE), // Sea Shell
  ];

  // Data for the horizontal scrollable list
  List<String> horizontalTexts = [
    "From Grumpy to Grateful with Affirmations",
    "How to Create Your Own Affirmation in 3 Steps",
    // Add more titles if needed
  ];

  // List of images for the horizontal cards
  List<String> horizontalImages = [
    'assets/images/relaxing.png',
    'assets/images/reading.png',
    // Add more images if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          'Micro Reads',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommended Reads',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Larger Swipe Cards at the Top
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: CardSwiper(
                cardsCount: texts.length,
                cardBuilder: (context, index, x, y) {
                  return GestureDetector(
                    onTap: () {
                      if (texts[index] ==
                          "Overcoming Self-Doubt and Embracing Positivity") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FixedImageScrollPage(),
                          ),
                        );
                      } else if (texts[index] ==
                          "Recognizing Symptoms When Sadness Turns into Depression") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DepressionPage(),
                          ),
                        );
                      } else if (texts[index] ==
                          "Getting Started with Therapy - The First Step") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TherapyPage(), // Navigate to TherapyPage
                          ),
                        );
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: pastelColors[index % pastelColors.length],
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Image.asset(
                                images[index % images.length],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    texts[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                onSwipe: (previous, current, direction) {
                  // Handle swipe actions if needed
                  return true;
                },
              ),
            ),
          ),
          // Move Horizontal Scrollable Cards to the Bottom
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Minute Reads for you',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 200, // Increase the height of the horizontal cards
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: horizontalTexts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (horizontalTexts[index] ==
                        "From Grumpy to Grateful with Affirmations") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SlideShowPage(), // Navigate to MinReadsPage
                        ),
                      );
                    } else if (horizontalTexts[index] ==
                        "How to Create Your Own Affirmation in 3 Steps") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MinReadsPage(), // Navigate to MinReads2Page
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 250, // Increase the width of the horizontal cards
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: pastelColors[index % pastelColors.length],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            horizontalTexts[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            horizontalImages[index % horizontalImages.length],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
    home: SwipeExample(),
  ));
}
