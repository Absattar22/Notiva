import 'package:flutter/material.dart';
import 'package:notiva/constants.dart';
import 'package:notiva/widgets/custom_button_sheet.dart';
import 'package:notiva/widgets/notes_view_body.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  static const String id = 'notesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: kPrimaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            context: context,
            builder: (context) {
              return const CustomBottomSheet();
            },
          );
        },
        backgroundColor: const Color.fromARGB(255, 23, 159, 120),
        child: const Icon(Icons.add),
      ),
      backgroundColor: kPrimaryColor,
      body: const NotesViewBody(),
    );
  }
}
