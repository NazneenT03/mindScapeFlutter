import 'package:flutter/material.dart';

class TherapyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Fixed Image at the top with curved bottom edges
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/therapy_1.png'),
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
                        const Text(
                          "Getting Started with Therapy - The First Step",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                  'assets/images/icons8-user-location-30.png'),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shailaja Radhakrishnan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  "Psychologist",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "30 May, 2023",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Life often presents us with challenges, uncertainties, and moments of overwhelming emotions. During such times, seeking help from a professional therapist can be a transformative and empowering experience. However, taking that first step to start therapy can be intimidating for many.",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "The Power of Therapy",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Therapy provides a safe and confidential space to express ourselves openly, free from judgment. It allows us to explore our thoughts, emotions, and past experiences in a supportive environment. A therapist can offer valuable insights, coping strategies, and personalized tools to navigate through life's challenges. Moreover, therapy is not limited to addressing mental health concerns; it can also be instrumental in personal growth, self-awareness, and achieving life goals.\n",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Common Concerns",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Embarking on a therapeutic journey may raise some apprehensions. People often wonder if their problems are significant enough for therapy or if they can handle their issues on their own. It is essential to remember that seeking therapy is not a sign of weakness; rather, it is an act of courage and self-compassion. No concern is too big or small for therapy, and everyone can benefit from professional support. \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            NumberedPoint(
                              number: 1,
                              text:
                                  'Acknowledge Your Feelings: Recognize and validate your emotions about starting therapy. Embrace any nervousness or excitement, knowing that it is entirely normal. \n',
                              boldText: 'Acknowledge Your Feelings',
                            ),
                            NumberedPoint(
                              number: 2,
                              text:
                                  'Set Clear Intentions: Identify your reasons for seeking therapy and the goals you wish to achieve. This will help you communicate your needs effectively with your therapist. \n',
                              boldText: 'Set Clear Intentions',
                            ),
                            NumberedPoint(
                              number: 3,
                              text:
                                  "Ask Questions: Don't hesitate to ask your therapist about their approach, experience, and areas of expertise. A good therapist will be open to addressing your concerns. \n",
                              boldText: 'Ask Questions',
                            ),
                            NumberedPoint(
                              number: 4,
                              text:
                                  'Be Patient: Therapy is a process that may take time to yield tangible results. Be patient with yourself and trust the process. \n',
                              boldText: 'Be Patient',
                            ),
                            NumberedPoint(
                              number: 5,
                              text:
                                  'Openness and Honesty: Authenticity is crucial in therapy. Be open and honest with your therapist about your feelings, experiences, and challenges. \n',
                              boldText: 'Openness and Honesty',
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "The Journey Begins",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Starting therapy is an empowering decision that signifies a commitment to personal growth and well-being. As you take the first step, remember that you are not alone on this journey. Your therapist is there to support, guide, and walk alongside you through every twist and turn. Embrace the opportunity to discover yourself, develop resilience, and cultivate a happier, more fulfilling life. You are deserving of the care and support that therapy can offer. So, take that leap of faith, and let your transformative journey begin.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Back button overlay
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
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

class NumberedPoint extends StatelessWidget {
  final int number;
  final String text;
  final String boldText;

  const NumberedPoint({
    Key? key,
    required this.number,
    required this.text,
    required this.boldText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> parts = text.split(boldText);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number.',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Flexible(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
              children: [
                TextSpan(
                  text: parts[0],
                ),
                TextSpan(
                  text: boldText,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: parts.length > 1 ? parts[1] : '',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TherapyPage(),
  ));
}
