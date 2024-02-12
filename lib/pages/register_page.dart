import 'package:chat_messenger/components/my_buttons.dart';
import 'package:chat_messenger/components/my_text_field.dart';
import 'package:chat_messenger/pages/register_with_phone_page.dart';
import 'package:chat_messenger/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../screens/components/background.dart';
import '../screens/components/orDivider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});

  final Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    void signUp() {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("passwords do not match"),
          ),
        );
        return;
      }

      // get auth service
      final authService = Provider.of<AuthService>(context, listen: false);
      try {
        authService.signUpWithEmailAndPassword(
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
              MyTextField(
                hintText: ' First name',
                obscureText: false,
                controller: nameController,
                icon: Icons.drive_file_rename_outline_rounded,
              ),
              MyTextField(
                hintText: ' Email',
                obscureText: false,
                controller: emailController,
                icon: Icons.email_rounded,
              ),
              MyTextField(
                hintText: ' Password',
                obscureText: true,
                controller: passwordController,
                icon: Icons.key_rounded,
              ),
              MyTextField(
                hintText: 'Confirm Password',
                obscureText: true,
                controller: confirmPasswordController,
                icon: Icons.key_rounded,
              ),
              MyButton(
                buttonTitle: 'Sign up',
                onPressed: signUp,
              ),
              // const OrDivider(),
              MyButton(
                buttonTitle: 'Sign up with phone number',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterWithPhone(
                                onTap: widget.onTap,
                              )));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "  Already a member?  ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Login now",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
