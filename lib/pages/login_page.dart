import 'package:chat_messenger/components/my_buttons.dart';
import 'package:chat_messenger/components/my_text_field.dart';
import 'package:chat_messenger/constants/my_colors.dart';
import 'package:chat_messenger/services/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 153.0),
          child: GestureDetector(
              onTap: () {
                Provider.of<AuthService>(context, listen: false).toggleTheme();
              },
              child: Text('switch theme')),
        ),
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Dark Mode"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Light Mode"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              print("My account menu is selected.");
            } else if (value == 1) {
              print("Settings menu is selected.");
            }
          }),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                color: Theme.of(context).colorScheme.primary,
                size: 100,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Welcome Back! You've been missed",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 40,
              ),
              MyTextField(
                  hintText: '   Name',
                  obscureText: false,
                  controller: nameController),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                  hintText: '   Email',
                  obscureText: false,
                  controller: emailController),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                  hintText: '   Password',
                  obscureText: true,
                  controller: passwordController),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                buttonTitle: 'Sign in',
                onTap: signIn,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "  not a member?  ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register now",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: MyColors.buttonColor),
                    ),
                  ),
                ],
              ),
              // GestureDetector(
              //   onTap: (){},
              //   child: const Text(
              //     "new UI",
              //     style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //         color: MyColors.buttonColor),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
