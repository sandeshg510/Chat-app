import 'package:chat_messenger/components/already_have_an_account_acheck.dart';
import 'package:chat_messenger/constants/constants.dart';
import 'package:chat_messenger/screens/components/orDivider.dart';
import 'package:chat_messenger/screens/components/rounded_buttons.dart';
import 'package:chat_messenger/screens/components/rounded_input_fields.dart';
import 'package:chat_messenger/screens/components/social_icon.dart';
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
      topImage: 'lib/assets/images/signup_top.png',
      bottomImage: 'lib/assets/images/main_bottom.png',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Text(
          //   'SIGN UP',
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),

          SvgPicture.asset(
            'lib/assets/icons/signup.svg',
            height: size.height * 0.35,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          RoundedInputField(hintText: 'Enter Email', onChanged: (value) {}),
          RoundedInputField(
            hintText: 'Password',
            onChanged: (value) {},
            icon: Icons.key,
            suffixIcon: Icons.visibility,
          ),
          RoundedInputField(
              icon: Icons.key,
              suffixIcon: Icons.visibility,
              hintText: 'Confirm Password',
              onChanged: (value) {}),
          RoundedButton(
            title: 'SIGN UP',
            onPressed: () {},
            textColor: Colors.white,
            color: kPrimaryColor,
          ),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            login: false,
          ),
          const OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(
                iconPath: 'lib/assets/icons/facebook.svg',
                onPressed: () {},
              ),
              SocialIcon(
                iconPath: 'lib/assets/icons/dial_pad.svg',
                onPressed: () {},
              ),
              SocialIcon(
                iconPath: 'lib/assets/icons/google-plus.svg',
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
