import 'package:chat_messenger/constants/constants.dart';
import 'package:chat_messenger/screens/components/rounded_buttons.dart';
import 'package:chat_messenger/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'background.dart';

class Body1 extends StatelessWidget {
  const Body1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'SIGN UP',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            'lib/assets/images/signup_top.svg',
            height: size.height * 0.45,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedButton(
            title: 'SIGN UP',
            onPressed: () {},
            textColor: Colors.black,
            color: kPrimaryLightColor,
          )
        ],
      ),
    );
  }
}
