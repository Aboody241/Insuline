import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';

class HomeMedicalRemider extends StatelessWidget {
  final String title;
  final String time;
  const HomeMedicalRemider({
    super.key,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
            decoration: BoxDecoration(
              color: KsecondaryC,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(Icons.watch_later_outlined, size: 32),
          ),
          HorizentalSpace(3).of(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,
                style: InsulinNormalFonts.meduimNormalFont,
                textAlign: TextAlign.left,
              ),
              Text(
                time,
                style: InsulinNormalFonts.smallFont14.copyWith(color: KtherdC),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: KsecondaryC,
            ),
            child: Text("Take", style: InsulinNormalFonts.meduimNormalFont),
          ),
        ],
      ),
    );
  }
}
