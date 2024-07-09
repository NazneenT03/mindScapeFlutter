import 'package:flutter/material.dart';

class FixedImageScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Fixed Image at the top with curved bottom edges
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/self_doubt.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Scrollable Text content
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Overcoming Self-Doubt and Embracing Positivity",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                  'assets/images/icons8-user-location-30.png'),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shubhangi Rastogi",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  "Founder, Mind Alcove",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          "30 May, 2023",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "\"Our doubts are traitors, and make us lose the good we oft might win, by fearing to attempt.\"\n- William Shakespeare \n",
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Self-doubt and negativity can cast a shadow over our lives, impacting our view of ourselves and our capabilities. Even high achievers encounter moments of uncertainty. It's essential to address these patterns regularly to conquer self-doubt. Here are some strategies to help you break free from negative thoughts and embrace positivity:",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Positive Acknowledgement",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Embrace your doubts and negative thoughts as part of being human. By acknowledging and accepting them, you step out of your comfort zone, opening yourself up to new experiences that lead to personal growth. \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Positive Evidence",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Combat self-doubt by recalling all your past achievements, both in your personal and professional life. Reflect on the emotions associated with each success, reminding yourself of your capabilities and potential. \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Positive Distraction",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Combat self-doubt by recalling all your past achievements, both in your personal and professional life. Reflect on the emotions associated with each success, reminding yourself of your capabilities and potential. \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Positive Belief",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Ultimately, believe in your ability to conquer self-doubt and overcome your shortcomings. This self-belief will propel you towards reaching your highest potential faster and with greater ease. \n\n",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "By incorporating these strategies into your daily life, you can gradually build resilience against self-doubt and negativity. Embrace positivity, and watch yourself flourish on the path to achieving your goals and aspirations.",
                          style: TextStyle(fontSize: 16),
                        ),
                        // Add more content here...
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 40, // adjust the top position if necessary
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
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
    home: FixedImageScrollPage(),
  ));
}
