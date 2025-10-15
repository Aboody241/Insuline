import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/on_board_style.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';

class TipsWarningWidget extends StatelessWidget {
  const TipsWarningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        // Center(
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Icon(Icons.warning, color: Colors.red, size: 22),
        //           Text(
        //             "  BMI is not suitable for pregnant women !",
        //             style: OnBoardStyle.onBoardDisc.copyWith(
        //               color: Colors.redAccent,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
            VerticalSpace(2).of(context),
            Container(
  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
  decoration: BoxDecoration(
    color: KfourC,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Center(
    child: Column(
      children: [
        VerticalSpace(1).of(context),
        Icon(Icons.tips_and_updates, color: KtherdC),
        VerticalSpace(1).of(context),

        // النصوص كلها من List
        ...[
          "Enter your real weight and height for accurate results.",
          "It’s better to record your weight at the same time of day each time.",
          "Athletes may have a high BMI but still be healthy.",
          "Children and teenagers use different BMI charts.",
        ].map((tip) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                tip,
                style: OnBoardStyle.onBoardDisc.copyWith(
                  color: Colors.blueGrey[600],
                ),
              ),
            )),
      ],
    ),
  ),
)]);
  }
}