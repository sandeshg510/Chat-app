import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? Function(String?) validator;
  final TextInputType inputType;

  const MyTextFormField({
    super.key,
    required this.labelText,
    required this.obscureText,
    required this.controller,
    required this.validator,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(color: Colors.black54)),
      ),
    );
  }
}
