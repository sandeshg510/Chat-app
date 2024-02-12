import 'package:flutter/material.dart';
import 'package:chat_messenger/components/user_widget.dart';

class BuildContactAvatar extends StatelessWidget {
  final String name;
  const BuildContactAvatar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserWidget(),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    );
  }
}
