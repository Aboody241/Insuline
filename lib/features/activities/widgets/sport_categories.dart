
import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';

class CategoriesSport extends StatelessWidget {
  const CategoriesSport({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.055,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: KfourC,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Center(
              child: Text("category", style: InsulinSmallFonts.smallFont14),
            ),
          );
        },
      ),
    );
  }
}
