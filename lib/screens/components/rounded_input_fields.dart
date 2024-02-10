import 'package:chat_messenger/screens/components/textfield_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    super.key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
  });
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
            suffixIcon: Icon(
              suffixIcon,
              color: kPrimaryColor,
            ),
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            hintText: hintText),
      ),
    );
  }
}
