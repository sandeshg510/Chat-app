import 'package:flutter/material.dart';

class MyIconButtons extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  const MyIconButtons({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 24,
          color: Colors.white,
        ));
  }
}
