// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ticket/core/theme/theme.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
          elevation: WidgetStateProperty.all<double>(0),
          textStyle: WidgetStateProperty.all<TextStyle>(
            const TextStyle(color: Colors.white),
          ),
        ),
        onPressed: onPressed,
        child: Ink(
          height: 45,
          width: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.secondary, AppTheme.tertiary],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                    blurRadius: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
