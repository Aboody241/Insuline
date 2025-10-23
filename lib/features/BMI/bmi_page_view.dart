import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/assets/on_board_style.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';
import 'package:insulin95/features/BMI/widgets/bmi_page_body.dart';
import 'package:insulin95/features/recent_mbi_calculation/ui/bmi_recent_page.dart';

class BmiPageView extends StatelessWidget {
  const BmiPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BmiRecentPage()));
          }, icon: Icon(Icons.watch_later_outlined)),
                  HorizentalSpace(2).of(context),

        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 22,
            color: KblackC,
          ),
        ),
        title: Text(
          "Recalculate BMI",
          style: InsulinBoldFonts.meduimBoldFont18,
        ),
      ),
      body: BmiPageBody(),
    );
  }
}
