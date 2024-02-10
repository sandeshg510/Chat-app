import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: kPrimaryLightColor),
      child: child,
    );
  }
}
