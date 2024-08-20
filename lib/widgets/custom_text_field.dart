import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.maxLines = 1,
      required this.labelText});

  final String hintText;
  final int maxLines;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color.fromARGB(255, 36, 161, 105),
      maxLines: maxLines,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade600),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: const Color.fromARGB(255, 80, 95, 141),
      ),
    );
  }
}
