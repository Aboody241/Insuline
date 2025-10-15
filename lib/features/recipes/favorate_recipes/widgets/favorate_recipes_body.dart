import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';

class FavorateRecipesBody extends StatelessWidget {
  const FavorateRecipesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cheese Burger", style: InsulinBoldFonts.largeBoldFont),
        centerTitle: true,
        automaticallyImplyLeading: false,
        surfaceTintColor: KwhiteC,
        backgroundColor: KwhiteC,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset("assets/test_images/recipes_test.png"),
          ),
          Text(
            "Grilled Salmon with Asparagus",
            style: InsulinBoldFonts.meduimBoldFont18,
          ),
        ],
      ),
    );
  }
}
