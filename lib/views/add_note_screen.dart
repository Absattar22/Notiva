import 'package:flutter/material.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  static const String id = 'addNoteScreen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Add Note Screen'),
      ),
    );
  }
}
