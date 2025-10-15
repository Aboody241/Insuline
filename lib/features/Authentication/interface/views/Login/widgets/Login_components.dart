// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/on_board_style.dart';


class WelcomeObject extends StatelessWidget {
  const WelcomeObject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Welcome Back", style: OnBoardStyle.onBoardTitle);
  }
}


//===============================================

class LoginLogoImage extends StatelessWidget {
  const LoginLogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 3,
      child: Image.asset(
        "assets/main_images/image.png",
        width: 300,
        height: 100,
      ),
    );
  }
}


//====================================================
class DscriptionObject extends StatelessWidget {
  const DscriptionObject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Your personal diabetes tracker",
      style: OnBoardStyle.onBoardDisc,
    );
  }
}
