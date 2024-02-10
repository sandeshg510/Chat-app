import 'package:chat_messenger/constants/constants.dart';
import 'package:chat_messenger/screens/components/rounded_buttons.dart';
import 'package:chat_messenger/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../signup_screen.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({
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
            'WELCOME TO MESSENGER',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            'lib/assets/icons/chat.svg',
            height: size.height * 0.45,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedButton(
            title: 'LOGIN',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
          ),
          RoundedButton(
            title: 'SIGN UP',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignUpScreen()));
            },
            textColor: Colors.black,
            color: kPrimaryLightColor,
          )
        ],
      ),
    );
  }
}
