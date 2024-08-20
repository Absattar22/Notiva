import 'package:flutter/material.dart';
import 'package:notiva/views/home_screen.dart';
import 'package:notiva/views/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool onboarding = prefs.getBool('onboarding') ?? false;
  runApp(Notiva(
    onboarding: onboarding,
  ));
}

// ignore: camel_case_types, use_key_in_widget_constructors
class Notiva extends StatelessWidget {
  final bool onboarding;
  const Notiva({super.key, this.onboarding = false});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        OnBoardingScreen.id: (context) => OnBoardingScreen(),
      },
      initialRoute: onboarding ? HomeScreen.id : OnBoardingScreen.id,
    );
  }
}
