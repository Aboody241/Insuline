import 'package:flutter/material.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';
import 'package:insulin95/features/BMI/widgets/bmi_page_body.dart';

class BmiPageView extends StatelessWidget {
  const BmiPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CenterBackAppBar(title: "My BMI"),
      body: BmiPageBody(),
    );
  }
}
