import 'package:flutter/material.dart';
import 'package:notiva/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static const String id = 'searchScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const Center(
        child: Text('Search Screen'),
      ),
    );
  }
}
