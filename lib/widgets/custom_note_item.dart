import 'package:flutter/material.dart';
import 'package:notiva/models/note_model.dart';
import 'package:notiva/views/edit_note_screen.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditNoteScreen.id);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, top: 24.0, bottom: 24.0),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24.0,
                  fontFamily: 'poppins',
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    fontSize: 16.0,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  size: 30.0,
                  Icons.delete,
                  color: Color.fromARGB(255, 221, 14, 52),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                note.date.toString(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 14, 14, 14),
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
