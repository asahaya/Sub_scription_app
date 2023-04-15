import 'package:flutter/material.dart';

class ButtonFlame extends StatelessWidget {
  const ButtonFlame(
      {required this.label, required this.onPressed, this.colors, super.key});

  final String label;
  final VoidCallback onPressed;
  final Color? colors;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colors),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}