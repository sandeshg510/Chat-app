import 'package:chat_messenger/components/my_buttons.dart';
import 'package:chat_messenger/components/my_text_field.dart';
import 'package:chat_messenger/pages/register_with_phone_page.dart';
import 'package:chat_messenger/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.message,
                size: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Let's create an account for you",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 40,
              ),
              MyTextField(
                  hintText: ' First name',
                  obscureText: false,
                  controller: nameController),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  hintText: ' Email',
                  obscureText: false,
                  controller: emailController),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  hintText: ' Password',
                  obscureText: true,
                  controller: passwordController),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  hintText: 'Confirm Password',
                  obscureText: true,
                  controller: confirmPasswordController),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                buttonTitle: 'Sign up',
                onTap: signUp,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'OR',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey.shade800),
                ),
              ),
              MyButton(
                buttonTitle: 'Sign up with phone number',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterWithPhone(
                                onTap: widget.onTap,
                              )));
                },
              ),
              const SizedBox(
                height: 30,
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
