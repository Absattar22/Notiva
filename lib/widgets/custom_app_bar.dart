import 'package:flutter/material.dart';
import 'package:notiva/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontFamily: 'kalam',
            ),
          ),
          CustomSearchIcon()
        ],
      ),
    );
  }
}
