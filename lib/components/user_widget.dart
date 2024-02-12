import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 29,
      ),
    );
  }
}
