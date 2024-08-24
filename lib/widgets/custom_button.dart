import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading = false});

  final Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 14, 145, 193),
              Color.fromARGB(255, 169, 14, 193),
            ],
          ),
        ),
        child: Center(
          child: isLoading 
              ? const CircularProgressIndicator(
                  color: Color.fromARGB(255, 9, 92, 175),
                )
              : const Text(
                  'Add Note',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
