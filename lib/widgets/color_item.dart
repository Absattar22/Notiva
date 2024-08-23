import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});

  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 40,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: CircleAvatar(
              radius: 36,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 40,
            backgroundColor: color,
          );
  }
}
