import 'package:flutter/material.dart';
import 'package:notiva/constants.dart';

class IntroScreens extends StatelessWidget {
  IntroScreens(
      {super.key,
      required this.title,
      required this.img,
      required this.description});

  String title;
  String description;
  String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .center, 
          children: [
            Container(
              child: Image.asset(
                img,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20), 
            Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 10), // Add spacing between image and text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                description,
                textAlign: TextAlign.center, // Center align text
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 152, 145, 145),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
