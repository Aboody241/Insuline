
import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';

class ActivityDash extends StatelessWidget {
  const ActivityDash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: KfourC),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's Goal: 30 minutes",
                style: InsulinNormalFonts.smallFont14.copyWith(
                  color: KtherdC,
                ),
              ),
              VerticalSpace(0.5).of(context),
              Text(
                "Steps: 1000",
                style: InsulinBoldFonts.meduimBoldFont18,
              ),
              VerticalSpace(0.5).of(context),
              Text(
                "Calories Burned: 250",
                style: InsulinNormalFonts.smallFont14.copyWith(
                  color: KtherdC,
                ),
              ),
              VerticalSpace(2).of(context),
              // زر (حاليًا شكل فقط) — تقدر تحوّله GestureDetector لو تحب
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: KfourC,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "View",
                  style: InsulinNormalFonts.smallFont14,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.bar_chart_rounded,
              size: 45,
              color: Colors.green,
            ),
          ),
          HorizentalSpace(2).of(context),
        ],
      ),
    );
  }
}
