import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String title;
  const MyTextButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, right: 35),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
