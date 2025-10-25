import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';

class FoodGenerationPage extends StatelessWidget {
  const FoodGenerationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CenterBackAppBar(title: "Food Generation"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: Text("This Page in Progress" ,style: InsulinBoldFonts.largeBoldFont,),
        )
      ],),
    );
  }
}