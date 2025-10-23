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
          //Height
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
                  resault: state.bmi.toStringAsFixed(2), // دقة أعلى
                  status: state.category,
                );
              }
              if (state is BmiSaved) {
                return BmiReasault(
                  resault: state.bmi.toStringAsFixed(2), // دقة أعلى
                  status: state.category,
                );
              }
              if (state is BmiSaveSuccess) {
                return Column(
                  children: [
                    BmiReasault(
                      resault: state.bmi.toStringAsFixed(2), // دقة أعلى
                      status: state.category,
                    ),
                    VerticalSpace(1).of(context),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.green, size: 20),
                          SizedBox(width: 8),
                          Text(
                            "BMI result saved successfully!",
                            style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              if (state is BmiError) {
                return Text(
                  state.message,
                  style: TextStyle(color: Colors.red),
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

          BlocBuilder<BmiCubit, BmiState>(
            builder: (context, state) {
              if (state is BmiCalculated) {
                return CustomButton1(
                  color: KsecondaryC,
                  title: "Save Result",
                  titleColor: KblackC,
                  ontap: () {
                    context.read<BmiCubit>().saveBmiResult(
                      state.bmi,
                      state.category,
                      state.weight,
                      state.height,
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
