import 'package:chat_messenger/components/my_text_field.dart';
import 'package:chat_messenger/components/user_widget.dart';
import 'package:chat_messenger/screens/components/background.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Background(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserWidget(),
        ],
      )),
    );
  }
}
