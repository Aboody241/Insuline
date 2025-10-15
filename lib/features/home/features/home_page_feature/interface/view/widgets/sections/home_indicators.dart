import 'package:flutter/material.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/home_page_indicators.dart';


class HomeIndicators extends StatelessWidget {
  const HomeIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeBloodIndicator(),
        VerticalSpace(2).of(context),
        const HomeBMIIndicator(), // هنا بس
      ],
    );
  }
}
