import 'package:flutter/material.dart';
import 'package:notiva/widgets/custom_app_bar.dart';
import 'package:notiva/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(height: 10),
          CustomAppBar(title: 'Edit Notes', icon: Icons.check),
          SizedBox(height: 40),
          CustomTextField(
            hintText: 'Title',
            labelText: 'Enter Note Title',
          ),
          SizedBox(height: 24),
          CustomTextField(
            hintText: 'Description',
            labelText: 'Enter Note Description',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
