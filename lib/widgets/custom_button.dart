import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Save the note
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 135, 17, 194),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      child: const Text(
        'Add Note',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
