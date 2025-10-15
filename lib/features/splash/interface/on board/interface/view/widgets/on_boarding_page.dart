import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/on_board_style.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/data/models/on_bording_model.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.model});

  final OnBordingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(model.image, height: 360, width: double.infinity),
        VerticalSpace(3).of(context),
        Text(
          model.title,
          style: OnBoardStyle.onBoardTitle,
          textAlign: TextAlign.center,
        ),
        VerticalSpace(3).of(context),
        Text(
          model.subTitle,
          style: OnBoardStyle.onBoardDisc,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
