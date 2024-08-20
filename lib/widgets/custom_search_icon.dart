import 'package:flutter/material.dart';
import 'package:notiva/views/search_screen.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key,
  });

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
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
