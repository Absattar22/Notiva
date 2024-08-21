import 'package:flutter/material.dart';
import 'package:notiva/widgets/add_note_form.dart';


class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}
