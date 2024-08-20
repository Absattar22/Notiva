import 'package:flutter/material.dart';
import 'package:notiva/constants.dart';
import 'package:notiva/widgets/custom_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            CustomAppBar(),
          ],
        ),
      ),
    );
  }
}