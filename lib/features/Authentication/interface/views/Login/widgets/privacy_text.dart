import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/on_board_style.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
class PrivacyText extends StatelessWidget {
  const PrivacyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Text(
              "By logging in ,",
              style: OnBoardStyle.onBoardDisc,
              textAlign: TextAlign.center,
            ),
            VerticalSpace(1).of(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "you agree to our ",
              style: OnBoardStyle.onBoardDisc,
              textAlign: TextAlign.center,
            ),
            Text(" Terms" , style: OnBoardStyle.onBoardDisc.copyWith(color: KprimaryC,fontWeight: FontWeight.w800)),
            Text(" & ", ),
            Text("Privacy Policy" , style: OnBoardStyle.onBoardDisc.copyWith(color: KprimaryC , fontWeight: FontWeight.w800)),
          ],
        ),
      ],
    );
  }
}