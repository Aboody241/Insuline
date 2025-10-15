
import 'package:flutter/material.dart';
import 'package:insulin95/data/models/activities_model.dart';
import 'package:insulin95/core/assets/fonts.dart';

class ActivitiesItem extends StatelessWidget {
  const ActivitiesItem({
    super.key,
    required this.activity,
  });

  final ActivitiesModel activity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // النصوص
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                activity.title,
                style: InsulinBoldFonts.meduimBoldFont18,
              ),
              Text(
                activity.time,
                style: TextFontStyleSecColor.smallFont,
              ),
            ],
          ),
          // الصورة مع AspectRatio
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 160, // العرض ثابت
              child: AspectRatio(
                aspectRatio: 16 / 10, // النسبة (عرض:طول)
                child: Image.asset(
                  activity.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
