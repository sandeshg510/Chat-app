import 'package:chat_messenger/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: const Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              height: 1.5,
              color: Color(0xffD9D9D9),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'OR',
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Divider(
              height: 1.5,
              color: Color(0xffD9D9D9),
            ),
          )
        ],
      ),
    );
  }
}
