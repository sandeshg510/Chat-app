import 'package:chat_messenger/constants/constants.dart';
import 'package:chat_messenger/screens/components/body.dart';
import 'package:chat_messenger/screens/components/rounded_buttons.dart';
import 'package:chat_messenger/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'components/alredy_registerd_check.dart';
import 'components/background.dart';
import 'components/rounded_input_fields.dart';
import 'components/textfield_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'LOGIN',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                'lib/assets/icons/login.svg',
                height: size.height * 0.35,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedInputField(
                hintText: 'Your Email',
                icon: Icons.person,
                onChanged: (String value) {},
              ),
              RoundedInputField(
                hintText: 'Password',
                obscureText: true,
                suffixIcon: Icons.visibility,
                icon: Icons.lock,
                onChanged: (String value) {},
              ),
              RoundedButton(title: 'LOGIN', onPressed: () {}),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlredyRegisteredCheck(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
