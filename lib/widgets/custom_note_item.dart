import 'package:flutter/material.dart';
import 'package:notiva/views/edit_note_screen.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditNoteScreen.id);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, top: 24.0, bottom: 24.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 223, 175, 29),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Text(
                'Note Title',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 24.0,
                  fontFamily: 'poppins',
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Note Description Note Description Note Description Note Description',
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
                '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
