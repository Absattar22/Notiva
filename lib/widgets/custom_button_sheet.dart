import 'package:flutter/material.dart';
import 'package:notiva/widgets/custom_button.dart';
import 'package:notiva/widgets/custom_text_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
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
          SizedBox(height: 32),
          CustomButton()
        ],
      ),
    );
  }
}
