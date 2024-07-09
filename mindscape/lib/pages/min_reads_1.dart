import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SlideShowPage(),
  ));
}

class SlideShowPage extends StatefulWidget {
  @override
  _SlideShowPageState createState() => _SlideShowPageState();
}

class _SlideShowPageState extends State<SlideShowPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  bool _isPaused = false;
  Duration pageChangeDuration =
      Duration(seconds: 15); // Total duration for 4 screens

  List<Map<String, dynamic>> slides = [
    {
      "title": "\n\nFrom Grumpy to Grateful with Affirmations",
      "description":
          "Meet Aryan, not a morning person.\n\nEvery day began with no positive thoughts, a grumpy tone, and a chaotic rush to start the day.\n\nThe alarm clock was his number one enemy.",
      "color": Color(0xFFFFF0F5), // Lavender Blush
      "image": "assets/images/min_reads_1_1.png"
    },
    {
      "title": "\n\nIn the midst of chaos,",
      "description":
          "Aryan discovered daily affirmations.\n\nCurious, he decided to try them out.\n\nHe found a list of positive affirmations and incorporated them into his morning routine.",
      "color": Color(0xFFFFE4E1), // Misty Rose
      "image": "assets/images/min_reads_1_2.png"
    },
    {
      "title": "\n\nThe next morning,",
      "description":
          "Aryan woke up with a new outlook.\n\nInstead of groaning, he recited affirmations like \"I am capable\" and \"I attract happiness\".\n\nSurprisingly, he felt a subtle shift in his mindset.",
      "color": Color(0xFFFFF5EE), // Sea Shell
      "image": "assets/images/min_reads_1_3.png"
    },
    {
      "title": "\n\nPositive Days Ahead..",
      "description":
          "As Aryan stepped out with positivity, he noticed changes.\n\nColleagues responded differently, and challenges seemed more manageable.\n\nPositivity wasn't just in his mind; it transformed his entire day.\n\nA simple choice positively impacted his mental health and happiness.",
      "color": Color(0xFFFAF0E6), // Linen
      "image": "assets/images/min_reads_1_4.png"
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
