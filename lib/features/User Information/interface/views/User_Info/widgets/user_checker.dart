
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/on_board_style.dart';

class UserChecks extends StatelessWidget {
  final String title;
  const UserChecks({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: OnBoardStyle.onBoardTitle.copyWith(fontSize: 18),
        ),
        Transform.scale(
          scale: 1.1,
          child: Switch(
            
            activeColor: KprimaryC,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.blueGrey[200],
            value: false,
            onChanged: (vlaue) {},
          ),
        ),
      ],
    );
  }
}
