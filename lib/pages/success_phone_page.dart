import 'package:chat_messenger/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../components/my_buttons.dart';
import '../components/my_text_field.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
                height: 50,
              ),
              const Text(
                "Welcome!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "You're phone login is successful",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                buttonTitle: 'Go to home page',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
