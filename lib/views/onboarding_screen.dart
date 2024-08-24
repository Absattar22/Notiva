import 'package:flutter/material.dart';
import 'package:notiva/constants.dart';
import 'package:notiva/views/notes_screen.dart';
import 'package:notiva/views/intro_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  static const String id = 'onBoardingScreen';

  final List<dynamic> introScreens = [
    {
      'title': 'Welcome To Notiva',
      'description':
          'Capture your thoughts, ideas, and inspirations with ease. Your personal digital notebook is here to help you stay organized and creative.',
      'img': 'assets/images/intro1.png',
    },
    {
      'title': 'Stay Organized',
      'description':
          'Easily find what you need and keep your ideas neatly sorted, so you can focus on what matters most.',
      'img': 'assets/images/intro2.png',
    },
    {
      'title': 'Access Anytime, Anywhere',
      'description':
          'Access your notes anytime, anywhere. With seamless cloud sync, your notes are always within reach, whether you are on your phone, tablet, or computer.',
      'img': 'assets/images/intro3.png',
    },
    {
      'title': 'Get Started with Notiva',
      'description':
          'You are all set! Get started with Notiva and turn your ideas into action. Let us make note-taking effortless and enjoyable.',
      'img': 'assets/images/intro4.png',
    },
  ];

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  String _buttonText = 'Next';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        // Update the button text based on the current page
        if (_controller.page == 3) {
          _buttonText = 'Get Started';
        } else {
          _buttonText = 'Next';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              for (var screen in widget.introScreens)
                IntroScreens(
                  title: screen['title'],
                  description: screen['description'],
                  img: screen['img'],
                ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: ElevatedButton(
                onPressed: () async {
                  if (_controller.page == 3) {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('onboarding', true);

                    if (!mounted) return;
                    Navigator.pushReplacementNamed(context, NotesScreen.id);
                  } else {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInCirc);
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(20, 45),
                  backgroundColor: const Color.fromARGB(255, 23, 139, 201),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  _buttonText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 130,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmoothPageIndicator(
                  onDotClicked: (index) => _controller.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInCirc),
                  controller: _controller,
                  count: 4,
                  effect: const WormEffect(
                    activeDotColor: Color.fromARGB(255, 23, 139, 201),
                    dotColor: Color.fromARGB(255, 255, 255, 255),
                    dotHeight: 12,
                    dotWidth: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
