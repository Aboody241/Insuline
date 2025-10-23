import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insulin95/controllers/cubit/BMI/calculatebmi/calculatebmi_cubit.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/features/BMI/bmi_page_view.dart';

class HomeBloodIndicator extends StatelessWidget {
  const HomeBloodIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: KsecondaryC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// النصوص
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's Blood",
                style: InsulinNormalFonts.smallFont14.copyWith(color: KtherdC),
              ),
              Text("null mg/dL", style: InsulinBoldFonts.meduimBoldFont18),
              Text(
                "Normal range",
                style: InsulinNormalFonts.smallFont14.copyWith(color: KtherdC),
              ),
            ],
          ),
          SizedBox(height: 80, child: Image.asset("assets/home/insulin1.png")),
        ],
      ),
    );
  }
}

class HomeBMIIndicator extends StatelessWidget {
  const HomeBMIIndicator({super.key});

  String _getBodyMessage(String category) {
    switch (category.toLowerCase()) {
      case "healthy":
        return "Healthy body";
      case "normal":
        return "Normal body";
      case "overweight":
        return "Overweight body";
      case "obese":
        return "Obese body";
      default:
        return "Healthy weight";
    }
  }

  Color _getBodyColor(String category) {
    switch (category.toLowerCase()) {
      case "healthy":
        return Colors.green;
      case "normal":
        return Colors.yellow[700]!; // أصفر
      case "overweight":
      case "obese":
        return Colors.red;
      default:
        return KtherdC; // الافتراضي
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCubit, BmiState>(
      builder: (context, state) {
        String bmiText = "Not calculated yet";
        String categoryText = "";

        if (state is BmiCalculated) {
          bmiText = state.bmi.toStringAsFixed(2);
          categoryText = state.category;
        } else if (state is BmiSaved) {
          bmiText = state.bmi.toStringAsFixed(2);
          categoryText = state.category;
        } else if (state is BmiSaveSuccess) {
          bmiText = state.bmi.toStringAsFixed(2);
          categoryText = state.category;
        }

        return GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => BmiPageView()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: KsecondaryC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BMI Summary",
                      style: InsulinNormalFonts.smallFont14.copyWith(
                        color: KtherdC,
                      ),
                    ),
                    VerticalSpace(.5).of(context),
                    Text(bmiText, style: InsulinBoldFonts.meduimBoldFont18),
                    VerticalSpace(.5).of(context),

                    Text(
                      categoryText.isNotEmpty
                          ? _getBodyMessage(categoryText)
                          : "Healthy weight",
                      style: InsulinNormalFonts.smallFont14.copyWith(
                        color: _getBodyColor(categoryText),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                  child: Image.asset("assets/home/bmi_home.png"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
