import 'package:chat_messenger/screens/components/textfield_container.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData? suffixIcon;
  final IconData icon;

  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller,
      this.suffixIcon,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(
            suffixIcon,
            color: kPrimaryColor,
          ),
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          filled: true,
        ),
      ),
    );
  }
}
