import 'package:chat_messenger/constants/my_colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonTitle;
  final void Function() onTap;
  const MyButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(32),
        ),
        height: 55,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
