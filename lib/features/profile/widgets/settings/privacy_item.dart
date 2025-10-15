
import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';

class PrivacyItem extends StatelessWidget {
  const PrivacyItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
          decoration: BoxDecoration(
            color: KsecondaryC,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(Icons.shield_outlined, size: 32),
        ),
        HorizentalSpace(5).of(context),
        
        Text("Privacy", style: InsulinNormalFonts.smallFont16),
      ],
    );
  }
}
