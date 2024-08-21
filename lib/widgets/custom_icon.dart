import 'package:flutter/material.dart';
import 'package:notiva/views/search_screen.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key, required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 18, 1, 78).withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, SearchScreen.id);
        },
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
