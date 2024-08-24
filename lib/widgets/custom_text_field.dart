import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    required this.labelText,
    this.controller, // Add this line
    this.onSaved,
    this.validator,
    this.onChanged,
  });

  final String hintText;
  final int maxLines;
  final String labelText;

  final TextEditingController? controller; // Add this line
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 36, 161, 105), // Start color
            Color.fromARGB(255, 80, 95, 141), // End color
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(2), // Adjust padding as needed
      child: TextFormField(
        controller: controller, // Use the controller
        validator: validator,
        onChanged: onChanged,
        onSaved: onSaved,
        cursorColor: Colors.white,
        maxLines: maxLines,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade200),
          labelText: labelText,
          labelStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}
