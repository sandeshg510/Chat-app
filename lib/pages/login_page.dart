import 'package:chat_messenger/components/my_buttons.dart';
import 'package:chat_messenger/components/my_icon_buttons.dart';
import 'package:chat_messenger/components/my_text_field.dart';
import 'package:chat_messenger/constants/constants.dart';
import 'package:chat_messenger/constants/my_colors.dart';
import 'package:chat_messenger/pages/new/new_home_page.dart';
import 'package:chat_messenger/screens/components/alredy_registerd_check.dart';
import 'package:chat_messenger/screens/components/background.dart';
import 'package:chat_messenger/screens/welcome_screen.dart';
import 'package:chat_messenger/services/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    TextEditingController passwordController = TextEditingController();
    void signIn() {
      final authService = Provider.of<AuthService>(context, listen: false);

      try {
        authService.signInWithEmailAndPassword(
            email: emailController.text.toString().trim(),
            password: passwordController.text,
            name: nameController.text);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }

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
              MyTextField(
                hintText: '   Name',
                obscureText: false,
                controller: nameController,
                icon: Icons.edit,
              ),
              MyTextField(
                  hintText: '   Email',
                  obscureText: false,
                  icon: Icons.email_rounded,
                  controller: emailController),
              MyTextField(
                hintText: '   Password',
                obscureText: true,
                controller: passwordController,
                icon: Icons.key,
              ),
              MyButton(
                buttonTitle: 'Sign in',
                onPressed: signIn,
              ),
              AlredyRegisteredCheck(onPressed: widget.onTap),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewHomePage()));
                },
                child: const Text(
                  "new UI",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MyColors.buttonColor),
                ),
              ),
              MyIconButtons(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen()));
                  },
                  icon: Icons.add_to_home_screen)
            ],
          ),
        ),
      ),
    );
  }
}
