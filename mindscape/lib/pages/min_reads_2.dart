import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MinReadsPage(),
  ));
}

class MinReadsPage extends StatefulWidget {
  @override
  _MinReadsPageState createState() => _MinReadsPageState();
}

class _MinReadsPageState extends State<MinReadsPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  bool _isPaused = false;
  Duration pageChangeDuration =
      Duration(seconds: 15); // Total duration for 4 screens

  List<Map<String, dynamic>> slides = [
    {
      "title": "\n\nCreate your own Affirmations",
      "description":
          "Positive affirmations are phrases you repeat to yourself with the desired outcome in mind. They work because of a scientific principle known as neuroplasticity, which is the ability of our words to rewire our brains. Hence affirmations are positive statements that can help you to overcome negative thoughts and patterns by rewiring your mind and achieving your desired outcome.",
      "color": Color(0xFFFFF0F5), // Lavender Blush
      "image": "assets/images/min_reads_2_1.png"
    },
    {
      "title": "\n\nIdentify Your Goal",
      "description":
          "Decide what you want to affirm. It could be confidence, success, or happiness.",
      "color": Color(0xFFFFE4E1), // Misty Rose
      "image": "assets/images/min_reads_2_2.png"
    },
    {
      "title": "\n\nCreate Your Affirmation",
      "description":
          "Use positive language and present tense. Keep it short and specific to make it memorable.\n\nExample,\n\n\"I am worthy of love and respect\"\n\n\"I am deserving of good things\" ",
      "color": Color(0xFFFFF5EE), // Sea Shell
      "image": "assets/images/min_reads_2_3.png"
    },
    {
      "title": "\n\nRepeat Daily",
      "description":
          "Say your affirmation aloud or pin it on your wall. Repeat it each morning upon waking up or at night before going to bed with great belief to manifest your desires.",
      "color": Color(0xFFFAF0E6), // Linen
      "image": "assets/images/min_reads_2_4.png"
    }
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(pageChangeDuration ~/ slides.length, (Timer timer) {
      if (!_isPaused) {
        _nextPage();
      }
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() {
      _isPaused = true;
    });
  }

  void _resumeTimer() {
    setState(() {
      _isPaused = false;
    });
    _startTimer();
  }

  void _nextPage() {
    if (_currentPage < slides.length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pop(context); // Go back to the previous page
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
    } else {
      _currentPage = slides.length - 1;
    }
    _pageController.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _pauseTimer,
      onLongPressUp: _resumeTimer,
      onTapUp: (details) {
        if (details.localPosition.dx > MediaQuery.of(context).size.width / 2) {
          _nextPage();
        } else {
          _previousPage();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: slides.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.asset(
                      slides[index]['image'] ??
                          'assets/images/mindscape-high-resolution-logo-transparent.png', // Provide a default image in case of null
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Container(
                      color: slides[index]['color'].withOpacity(0.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              slides[index]['title']!,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              slides[index]['description']!,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              top: 20, // Add some space above the progress bar
              left: 0,
              right: 0,
              child: LinearProgressIndicator(
                value: (_currentPage + 1) / slides.length,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
