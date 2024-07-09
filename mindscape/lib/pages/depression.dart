import 'package:flutter/material.dart';

class DepressionPage extends StatelessWidget {
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
                      image: AssetImage('assets/images/depression_1.png'),
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
                          "Recognizing Symptoms When Sadness Turns into Depression",
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
                          "Sadness is a natural part of the human emotional spectrum. At times, we all experience moments of sadness due to various life challenges, losses, or disappointments. However, sadness is a transient emotion, and in most cases, it fades away as we process our feelings and find comfort in supportive relationships and activities we once enjoyed. Yet, for some individuals, sadness can become overwhelming and persistent, transforming into something more severe depression.",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Understanding the difference between normal sadness and clinical depression is crucial for early recognition and timely intervention. Depression is a serious mental health condition that affects millions of people worldwide. According to the World Health Organization (WHO), over 264 million people suffer from depression globally, making it a leading cause of disability.",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Distinguishing Between Sadness and Depression",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "While both sadness and depression may share some symptoms, such as feelings of low mood and disinterest in activities, there are distinct differences that set them apart: \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Duration and Intensity",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Sadness is a temporary emotional response with identifiable triggers. It usually passes within a reasonable timeframe, allowing individuals to resume normal functioning. In contrast, depression persists for extended periods and can last for weeks, months, or even years. The intensity of depressive feelings is more severe and pervasive, affecting every aspect of life. \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Triggers and Reactions",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Sadness often emerges in response to specific life events, such as the loss of a loved one or a personal disappointment. In contrast, depression can develop without apparent triggers or can be triggered by minor events that wouldn't typically lead to prolonged distress. \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Energy and Interest",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "While feeling sad may lead to a temporary decrease in energy and motivation, people experiencing sadness usually retain some level of interest in daily activities and relationships. In depression, individuals often lose interest in activities they once enjoyed, leading to a significant decline in energy levels and withdrawal from social interactions. \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Sleep and Appetite",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Sadness might affect sleep patterns and appetite temporarily, but these disruptions tend to resolve with time. Depression, however, leads to persistent sleep disturbances, such as insomnia or oversleeping, and changes in appetite, either a significant increase or decrease. \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Emotional Pain vs. Physical Pain",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Sadness may lead to moments of emotional pain, such as crying or grieving, but it typically doesn't cause physical symptoms. In depression, individuals may experience unexplained physical pain, such as headaches, stomachaches, or body aches. \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Self-Worth and Self-Criticism",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Sadness may cause temporary feelings of self-doubt, but it doesn't usually result in a pervasive sense of worthlessness or excessive self-criticism. People with depression often struggle with feelings of inadequacy, guilt, or self-loathing. \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Recognizing Symptoms of Depression",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Depression manifests in a variety of emotional, cognitive, and physical symptoms. Some common signs of depression include: \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        const BulletPoint(
                            text:
                                "Persistent feelings of sadness, emptiness, or hopelessness."),
                        const BulletPoint(
                            text:
                                "Loss of interest or pleasure in once-enjoyable activiies."),
                        const BulletPoint(
                            text: "Changes in appetite or weight."),
                        const BulletPoint(
                            text:
                                "Sleep disturbances, such as insomnia or hypersomnia."),
                        const BulletPoint(text: "Fatigue or loss of energy."),
                        const BulletPoint(
                            text:
                                "Feelings of worthlessness or excessive guilt."),
                        const BulletPoint(
                            text:
                                "Difficulty concentrating or making decisions."),
                        const BulletPoint(
                            text: "Recurring thoughts of death or suicide. \n"),
                        const SizedBox(height: 8),
                        const Text(
                          "It's essential to note that not everyone experiencing depression will display these symptoms, and individual experiences may vary. Additionally, other medical or psychological conditions can mimic depression, so a comprehensive evaluation by a mental health professional is essential for an accurate diagnosis.",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Seeking Help and Support",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Recognizing symptoms when sadness evolves into depression is crucial for seeking help and support. If you or someone you know is experiencing persistent feelings of depression, it's essential to reach out to a mental health professional. There is no shame in seeking help, and early intervention significantly improves the prognosis of depression. \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Therapy, counseling, and, if necessary, medication can be effective in managing depression. Additionally, supportive friends and family play a vital role in helping individuals navigate through challenging times.  \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Self-Care and Coping Strategies",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "While professional help is essential for addressing depression, there are some self-care strategies that may also be helpful: \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        const BulletPoint(
                            text:
                                "Engage in activities that bring joy and pleasure."),
                        const BulletPoint(
                            text:
                                "Practice mindfulness and meditation to manage stress and improve emotional well-being."),
                        const BulletPoint(
                            text:
                                "Prioritize self-care, including proper nutrition, exercise, and sufficient rest."),
                        const BulletPoint(
                            text:
                                "Seek social support and connect with loved ones."),
                        const BulletPoint(
                            text:
                                "Limit exposure to negative influences, such as news or social media."),
                        const SizedBox(height: 8),
                        const Text(
                          "Remember, depression is treatable, and with the right support and coping strategies, individuals can overcome its challenges and regain emotional well-being. If you or someone you know is struggling with depression, don't hesitate to seek help recovery and healing are possible.",
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

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.brightness_1, size: 8, color: Colors.black),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DepressionPage(),
  ));
}
