import 'package:flutter/material.dart';


class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key, required this.icon, this.onPressed,
  });

  final IconData icon;

  final void Function()? onPressed;

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
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
