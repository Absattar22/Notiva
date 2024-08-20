import 'package:flutter/material.dart';
import 'package:notiva/constants.dart';
import 'package:notiva/widgets/notes_view_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String id = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const NotesViewBody(),
    );
  }
}
