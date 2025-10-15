
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/data/models/on_bording_model.dart';

class OnbordingIndicator extends StatelessWidget {
  const OnbordingIndicator({
    super.key,
    required this.currentIndex,
    required this.pages,
  });

  final int currentIndex;
  final List<OnBordingModel> pages;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      position: currentIndex.toDouble(),
      dotsCount: pages.length,
      decorator: DotsDecorator(
        color: KsecondaryC,
        activeColor: KprimaryC,
      ),
    );
  }
}