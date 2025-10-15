// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insulin95/controllers/cubit/BMI/calculatebmi/calculatebmi_cubit.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/on_board_style.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/All_Forms.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';
import 'package:insulin95/core/widgets/custom_buttons.dart';
import 'package:insulin95/features/User%20Information/interface/views/Bmi_caculate/widgets/bmi_resalt.dart';
import 'package:insulin95/features/User%20Information/interface/views/Bmi_caculate/widgets/tips_warning_widget.dart';
import 'package:insulin95/features/User%20Information/interface/views/User_Info/user_information_view.dart';
import 'package:page_transition/page_transition.dart';

class BmiCalculatorBody extends StatelessWidget {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  BmiCalculatorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text("Bmi Calculator", style: OnBoardStyle.onBoardTitle),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.logout_outlined, size: 26),
        ),
      ),

      //================================================
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const TipsWarningWidget(),

                  VerticalSpace(2).of(context),

                  BasicFormField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    textHint: "Height  (cm)",
                    sufixIcon: Icon(Icons.height_rounded, color: KtherdC),
                  ),

                  BasicFormField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    textHint: "Weight  (kg)",
                    sufixIcon: Icon(Icons.scale_sharp, color: KtherdC),
                  ),

                  VerticalSpace(2).of(context),

                  BlocBuilder<BmiCubit, BmiState>(
                    builder: (context, state) {
                      if (state is BmiCalculated) {
                        return BmiReasault(
                          resault: state.bmi.toStringAsFixed(1), // دقة أعلى
                          status: state.category,
                        );
                      }
                      return const Text("Enter your data to calculate BMI");
                    },
                  ),

                  VerticalSpace(9).of(context),
                  CustomButton1(
                    color: KprimaryC,
                    title: "Calculate",
                    titleColor: Colors.white,
                    ontap: () {
                      final weight = double.tryParse(weightController.text);
                      final height = double.tryParse(heightController.text);

                      if (weight != null && height != null) {
                        context.read<BmiCubit>().calculateBmi(weight, height);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter valid numbers"),
                          ),
                        );
                      }
                    },
                  ),
                  VerticalSpace(2).of(context),
                  CustomButton1(
                    color: KsecondaryC,
                    title: "Next",
                    titleColor: KblackC,
                    ontap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: UserInformationView(),
                        ),
                      );
                    },
                  ),
                  VerticalSpace(2).of(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
