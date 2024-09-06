import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;

  final Function()? onPressed;

  AppButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.all(14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(text,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }
}