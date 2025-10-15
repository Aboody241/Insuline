import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/on_board_style.dart';
import 'package:insulin95/features/Authentication/interface/views/Signup/signup_page_view.dart';
import 'package:page_transition/page_transition.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeftWithFade,
        child: SignupPageView()
        )
        );
      },
      child: Row(
        children: [
          Text(
            "Don't Have Account?  ",
            style: OnBoardStyle.onBoardDisc.copyWith(color: Colors.grey.shade600),
          ),
          Text(
            "Signup",
            style: TextStyle(color: KprimaryC, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
