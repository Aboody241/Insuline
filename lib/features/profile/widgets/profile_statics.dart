import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';

class ProfileStatics extends StatelessWidget {
  const ProfileStatics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            HorizentalSpace(3.5).of(context),
            Text("Statistics", style: InsulinBoldFonts.largeBoldFont)],
        ),
        VerticalSpace(2.5).of(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.28, // علشان يدي مساحة كويسة للصور + النصوص
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [ Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ), // المسافة من الطرفين
              child: Row(
                children: [
                  _buildStatCard(context),
                  const SizedBox(width: 16),
                  _buildStatCard(context),
                  const SizedBox(width: 16),
                  _buildStatCard(context),
                ],
              ),
            ),
        ]  ),
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 160,
          height: 160,
          child: Image.asset("assets/test_images/spor.png"),
        ),
        VerticalSpace(1.5).of(context),
        Text("Total Activities", style: InsulinNormalFonts.smallFont16),
        VerticalSpace(.2).of(context),
        Text(
          "120",
          style: InsulinNormalFonts.smallFont14.copyWith(
            fontWeight: FontWeight.w700,
            color: KPurble,
          ),
        ),
      ],
    );
  }
}
