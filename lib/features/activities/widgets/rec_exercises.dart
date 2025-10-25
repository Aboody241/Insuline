
import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';

class RecExercises extends StatelessWidget {
  const RecExercises({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // ارتفاع ثابت بدلاً من الاعتماد على SizeConfig
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.4,
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/test_images/walk1.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Walking",
                  style: InsulinBoldFonts.meduimBoldFont18,
                ),
                Text(
                  "30 minutes Daily",
                  style: InsulinNormalFonts.smallFont14.copyWith(
                    color: KtherdC,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

