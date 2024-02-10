import 'package:chat_messenger/screens/components/background.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
