import 'package:flutter/material.dart';
import 'package:notiva/constants.dart';
import 'package:notiva/models/note_model.dart';
import 'package:notiva/widgets/edit_note_view_body.dart';
import 'package:notiva/widgets/notes_view_body.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key , required this.note});

  final NoteModel note;

  static const String id = 'editNoteScreen';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: EditNoteViewBody(note: note),
    );
  }
}
