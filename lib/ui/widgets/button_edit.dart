import 'package:flutter/material.dart';
import 'package:ticket/core/theme/theme.dart';

class ButtonEdit extends StatelessWidget {
  const ButtonEdit({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: AppTheme.styleButton,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Text(
              text,
              style: AppTheme.dataTimeDisplay,
            ),
          ),
        ),
      ),
    );
  }
}
