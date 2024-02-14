import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
    this.topImage = 'lib/assets/images/main_top.png',
    this.bottomImage = 'lib/assets/images/login_bottom.png',
  });
  final String topImage;
  final String bottomImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              topImage,
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              bottomImage,
              width: size.width * 0.35,
            ),
          ),
          child
        ],
      ),
    );
  }
}
