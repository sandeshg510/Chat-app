import 'package:flutter/material.dart';
import 'package:chat_messenger/components/user_widget.dart';

class BuildConversationRow extends StatelessWidget {
  const BuildConversationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                UserWidget(),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'name',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Hello! How are you?',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '15.30',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                SizedBox(
                  height: 15,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Color(0xff27c1a9),
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 10),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
