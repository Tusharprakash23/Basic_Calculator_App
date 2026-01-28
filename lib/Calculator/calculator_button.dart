import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {

  final String text;
  final Color? color;
  final Function(String) onTap;

  const CalculatorButton({
    super.key,
    required this.text,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[850],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(vertical: 18),
          ),
          onPressed: () => onTap(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
