import 'package:flutter/material.dart';
import 'package:mindscape/pages/signup_page.dart';
import 'package:mindscape/reusable_widgets/reusable_widgets.dart';
import 'package:mindscape/utilities/colors_util.dart';
import 'package:mindscape/pages/home_page.dart'; // Import the home page
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  Future<void> postRequest() async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://mind-scape-django.vercel.app/login/'), // Replace with your Django backend URL
        headers: {
          'Content-Type': 'application/json', // Specify the content-type
        },
        body: jsonEncode({
          'username': _emailTextController.text,
          'password': _passwordTextController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Registration successful
        Map<String, dynamic> user = jsonDecode(response.body);
        print(user);
        if (user['data'] == 'user not exists') {
          throw ('user not');
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MoodPage(username: user['data']['user_name'],email: user['data']['email'])),
          );
        }
        print('User registered successfully');
      } else {
        print(_emailTextController.text);
        // Registration failed
        print('Failed to register user: ${response.body}');
      }
    } catch (e) {
      print('Error registering user: $e');
      // Show error message to user
    }
  }

  void handleLogin() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("ffe6e8"),
              hexStringToColor("acd8aa"),
              hexStringToColor("f48498"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget(
                    "assets/images/mindscape-high-resolution-logo-transparent.png"),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Username: ", Icons.person_outline,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password: ", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the home page when the login button is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoodPage(
                                username: '',
                                email:''
                              )),
                    );
                  },
                  child: ElevatedButton(
                    onPressed: () => postRequest(),
                    child: const Text("Login"),
                  ),
                ),
                Container(child: signUpOption(context))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don't have an account? Try to",
        style: TextStyle(color: Colors.white70),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpPage()),
          );
        },
        child: const Text(
          " Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}
