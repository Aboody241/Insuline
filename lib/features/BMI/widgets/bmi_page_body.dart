import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insulin95/controllers/cubit/BMI/calculatebmi/calculatebmi_cubit.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/All_Forms.dart';
import 'package:insulin95/core/widgets/custom_buttons.dart';
import 'package:insulin95/features/User%20Information/interface/views/Bmi_caculate/widgets/bmi_resalt.dart';

class BmiPageBody extends StatelessWidget {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  BmiPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          BasicFormField(
            controller: weightController,
            keyboardType: TextInputType.number,

            textHint: "Weight  (kg)",
            sufixIcon: Icon(Icons.scale_sharp, color: KtherdC),
          ),
          //Height
          BasicFormField(
            controller: heightController,
            keyboardType: TextInputType.number,
            textHint: "Height  (cm)",
            sufixIcon: Icon(Icons.height_rounded, color: KtherdC),
          ),
          VerticalSpace(2).of(context),

          BlocBuilder<BmiCubit, BmiState>(
            builder: (context, state) {
              if (state is BmiCalculated) {
                return BmiReasault(
                  resault: state.bmi.toStringAsFixed(2), // دقة أعلى
                  status: state.category,
                );
              }
              return const Text("Enter your data to calculate BMI");
            },
          ),
          VerticalSpace(2).of(context),

          CustomButton1(
            color: KprimaryC,
            title: "Recalculate",
            titleColor: Colors.white,
            ontap: () {
              final weController = double.tryParse(weightController.text);
              final heController = double.tryParse(heightController.text);

              if (weController != null && heController != null) {
                context.read<BmiCubit>().calculateBmi(
                  weController,
                  heController,
                );
              }
            },
          ),

          VerticalSpace(2).of(context),

          CustomButton1(
            color: KsecondaryC,
            title: "Save Result",
            titleColor: KblackC,
            ontap: () {},
          ),
        ],
      ),
    );
  }
}
