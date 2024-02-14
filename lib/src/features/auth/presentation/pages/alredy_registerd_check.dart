import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class AlredyRegisteredCheck extends StatelessWidget {
  final bool login;
  final void Function()? onPressed;
  const AlredyRegisteredCheck({
    super.key,
    this.login = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: onPressed,
          child: const Text(
            "Sign up",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
