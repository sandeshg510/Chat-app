import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/constants.dart';

class SocialIcon extends StatelessWidget {
  final String iconPath;
  final void Function() onPressed;
  const SocialIcon({
    super.key,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: kPrimaryLightColor),
            shape: BoxShape.circle),
        child: SvgPicture.asset(
          iconPath,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
