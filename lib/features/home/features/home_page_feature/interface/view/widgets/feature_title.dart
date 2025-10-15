
import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/fonts.dart';

class FeaturesTitle extends StatelessWidget {
  final String featureTitle;
  const FeaturesTitle({super.key, required this.featureTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          featureTitle,
          style: InsulinBoldFonts.meduimBoldFont18,
        ),
      ],
    );
  }
}
