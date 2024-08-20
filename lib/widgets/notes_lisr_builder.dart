import 'package:flutter/material.dart';
import 'package:notiva/widgets/custom_note_item.dart';

class NotesListBuilder extends StatelessWidget {
  const NotesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: NotesItem(),
        );
      },
    );
  }
}
