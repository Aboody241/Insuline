import 'package:flutter/material.dart';

class LoginDivider extends StatelessWidget {
  final String title;

  const LoginDivider({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
        ),
        Text(title),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
        ),
      ],
    );
  }
}
