import 'package:flutter/material.dart';

class AccountSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/mindscape-high-resolution-logo-transparent.png', // Replace with your image asset
                              height: 100,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                      content:
                          Text('Are you sure you want to delete your account?'),
                      actions: <Widget>[
                        Center(
                          child: Container(
                            width: 160, // Adjusted width for smaller button
                            margin: EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                              color: Color(
                                  0xFFD699FA), // Background color for the button
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                              ),
                              child: Text(
                                'Yes, Delete Account',
                                style: TextStyle(
                                  color:
                                      Colors.white, // Text color for the button
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                // Add your delete account logic here
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            child: Text(
                              'No, Log Out Instead',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF9C4), // Pastel Yellow
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Delete Account',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'When you decide to delete your account, all your mood data & journal entries will be deleted forever.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
