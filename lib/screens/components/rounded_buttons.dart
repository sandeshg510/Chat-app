import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color color, textColor;
  const RoundedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextButton(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
          backgroundColor: MaterialStatePropertyAll<Color>(color),
          fixedSize: const MaterialStatePropertyAll(
            Size.fromWidth(300),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
