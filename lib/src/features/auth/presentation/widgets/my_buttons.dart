import 'package:chat_messenger/constants/my_colors.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MyButton extends StatelessWidget {
  final String buttonTitle;
  final void Function() onPressed;
  final Color color, textColor;

  const MyButton({
    super.key,
    required this.buttonTitle,
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
          buttonTitle,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
