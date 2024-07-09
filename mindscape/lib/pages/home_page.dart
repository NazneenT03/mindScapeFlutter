// ignore_for_file: unused_field, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this line for date formatting
import 'package:image_picker/image_picker.dart';
import 'package:mindscape/pages/calendar.dart';
import 'package:mindscape/pages/explore.dart';
import 'package:mindscape/pages/journal.dart';
import 'package:mindscape/pages/login_page.dart';
import 'package:mindscape/pages/talk_to_expert.dart';
import 'package:mindscape/pages/therapy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'accountsettings.dart';
import 'profile.dart';
import 'package:mindscape/pages/micro_reads.dart';
import 'package:mindscape/pages/deep_breathe.dart';
import 'package:http/http.dart' as http;

class MoodPage extends StatefulWidget {
  final String username;
  final String email;
  MoodPage(
      {required this.username,
      required this.email}); // Define the username parameter

  @override
  _MoodPageState createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  Color _backgroundColor = Color(0xFFF5F5DC); // Pale cream color
  int _selectedIndex = 0;
  File? _image;

  void _updateMood(String mood) {
    setState(() {
      switch (mood) {
        case 'Amazing':
          _backgroundColor = Color(0xFFFFF9C4); // Pastel Yellow
          break;
        case 'Good':
          _backgroundColor = Color(0xFFFFC1E3); // Pastel Pink
          break;
        case 'Okay':
          _backgroundColor = Color(0xFFD1C4E9); // Pastel Purple
          break;
        case 'Bad':
          _backgroundColor = Color(0xFFB3E5FC); // Pastel Blue
          break;
        case 'Terrible':
          _backgroundColor = Color(0xFFFFE0B2); // Pastel Orange
          break;
      }
    });
  }

  Future<void> _showImagePickerOptions(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Take from camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text('Cancel'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // No action needed as this is the current page
        break;
      case 1:
        // Navigate to ExplorePage
        // Example of navigation using named routes
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => HomeScreen()));
        // Navigator.pushNamed(context, '/explore');
        break;
      case 2:
        // Navigate to JournalPage
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => MyJournalPage()));
        break;
      case 3:
        // Navigate to CalendarPage
        Navigator.push(context,
            MaterialPageRoute(builder: (builder) => GoalCalendarPage()));
        break;
      case 4:
        // Navigate to TalkToExpertsPage
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => ExpertListPage()));
        break;
    }
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, MMMM d').format(DateTime.now());

    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.whatshot, color: Colors.red),
            onPressed: () {
              // Add streak button functionality here
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: NavigationDrawer(
        showImagePickerOptions: _showImagePickerOptions,
        username: '',
        email: '',
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5), // Space for status bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/mindscape-high-resolution-logo-transparent.png',
                            height: 180,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Text(
                    '${_getGreeting()}, ${widget.username}!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'How Are You Feeling Today?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildMoodButton(
                            'Amazing', 'assets/images/amazing.png'),
                        _buildMoodButton('Good', 'assets/images/smile.png'),
                        _buildMoodButton('Okay', 'assets/images/ok.png'),
                        _buildMoodButton('Bad', 'assets/images/bad.png'),
                        _buildMoodButton(
                            'Terrible', 'assets/images/terrible.png'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildHeaderCard(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today's Checklist",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _buildRoutineCard('Daily Journal', '2 mins activity',
                      'assets/images/writing.png', 'Start Writing'),
                  _buildRoutineCard('Micro Reads', '5 mins activity',
                      'assets/images/reading.png', 'Read Now'),
                  _buildRoutineCard('Deep Breathing', '3 mins activity',
                      'assets/images/deep_breathe.png', 'Start Breathing'),
                ],
              ),
            ),
          ),
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.today, size: 30), // Adjusted icon size
                label: 'Today',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore, size: 30), // Adjusted icon size
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book, size: 30), // Adjusted icon size
                label: 'Journal',
              ),
              BottomNavigationBarItem(
                icon:
                    Icon(Icons.calendar_today, size: 30), // Adjusted icon size
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon:
                    Icon(Icons.local_hospital, size: 30), // Adjusted icon size
                label: 'Therapy',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor:
                Color(0xFF81D4FA), // Selected item color (Pastel Blue)
            unselectedItemColor: Colors.grey[600], // Unselected item color
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }

  Widget _buildMoodButton(String mood, String asset) {
    return GestureDetector(
      onTap: () => _updateMood(mood),
      child: Column(
        children: [
          Image.asset(asset, height: 50, width: 50),
          SizedBox(height: 8),
          Text(mood),
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFF9C4), // Pastel Yellow
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Start your first journal',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text('Let us help you start your first journal'),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyJournalPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRoutineCard(
      String title, String duration, String asset, String buttonText) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFF9C4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(asset, height: 60, width: 60),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(duration),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _navigateToPage(title);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(String title) {
    switch (title) {
      case 'Daily Journal':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyJournalPage()));
        break;
      case 'Micro Reads':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SwipeExample()));
        break;
      case 'Deep Breathing':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DeepBreathe()));
        break;
      default:
        // Handle default case
        break;
    }
  }
}

class NavigationDrawer extends StatelessWidget {
  final Function(BuildContext) showImagePickerOptions;
  final String username;
  final String email;

  NavigationDrawer(
      {required this.showImagePickerOptions,
      required this.username,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 175, 152, 189), // Pastel Yellow
            ),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.account_circle,
                        size: 60, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Account Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountSettings()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                          username: username,
                          email: email,
                        )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sign Out'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20), // Adjust padding as needed
                    content: Column(
                      mainAxisSize:
                          MainAxisSize.min, // To restrict the dialog size
                      children: [
                        Text('Are you sure you want to sign out?'),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Sign Out'),
                              onPressed: () async {
                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                String? token = prefs.getString('token');
                                await prefs.remove('token');
                                if (token == null) return;

                                final response = await http.post(
                                  Uri.parse(
                                    'https://sixosi6856.pythonanywhere.com/api/accounts/logout/'), // Replace with your Django backend URL
                                  headers: <String, String>{
                                    'Content-Type': 'application/json; charset=UTF-8',
                                    'Authorization': 'token $token',
                                  },
                                );
                                if (response.statusCode == 200) {
                                  print('Request sent successfully.');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => LoginPage()));
                                } else {
                                  print('Failed to send request. Status code: ${response.statusCode}');
                                }

                                
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => MoodPage(username: '', email: ''),
      '/explore': (context) => HomeScreen(),
      '/journal': (context) => MyJournalPage(),
      '/calendar': (context) => GoalCalendarPage(),
      '/therapy': (context) => ExpertListPage(),
    },
  ));
}
