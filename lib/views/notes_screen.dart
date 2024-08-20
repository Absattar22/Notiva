import 'package:flutter/material.dart';
import 'package:notiva/constants.dart';
import 'package:notiva/views/add_note_screen.dart';
import 'package:notiva/widgets/notes_view_body.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  static const String id = 'notesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddNoteScreen.id);
        },
        backgroundColor: const Color.fromARGB(255, 23, 159, 120),
        child: const Icon(Icons.add),
      ),
      backgroundColor: kPrimaryColor,
      body: const NotesViewBody(),
    );
  }
}
