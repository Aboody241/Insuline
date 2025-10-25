import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/custom_buttons.dart';
import 'package:insulin95/features/ChatBoot/chatBoot_view.dart';
import 'package:insulin95/features/food%20generation/ui/pages/food_generation_page.dart';

class QuickAccessButtons extends StatelessWidget {
  const QuickAccessButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton2(
              padd: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              color: KprimaryC,
              title: "Food Generator",
              titleColor: KwhiteC,
              ontap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FoodGenerationPage()),
                );
              },
            ),
            CustomButton2(
              padd: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              color: KprimaryC,
              title: "Products Scanner",
              titleColor: KwhiteC,
              ontap: () {
                // TODO: Add Products Scanner functionality
              },
            ),
          ],
        ),
        VerticalSpace(2).of(context),
        CustomButton3(
          ontap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => ChatBootView()));
          },
          color: KprimaryC,
          titleColor: KprimaryC,
          padd: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/home/Ai_assetant.svg"),
              HorizentalSpace(2).of(context),
              Text(
                "AI Assistant",
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: KwhiteC,
                ),
              ),
            ],
          ),
        ),

        // CustomButton2(
        //   padd: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        //   color: PrimaryC,
        //   title: "Chat Boot",
        //   titleColor: WhiteC,
        // ),
      ],
    );
  }
}
