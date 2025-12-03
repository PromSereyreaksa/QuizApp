import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  final IconData? icon;

  const AppButton(
    this.label, {
    super.key,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 60,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 8,
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
