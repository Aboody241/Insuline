import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:insulin95/controllers/cubit/BMI/calculatebmi/calculatebmi_cubit.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';
import 'package:insulin95/data/models/bmi_result_model.dart';

class BmiRecentPage extends StatefulWidget {
  const BmiRecentPage({super.key});

  @override
  State<BmiRecentPage> createState() => _BmiRecentPageState();
}

class _BmiRecentPageState extends State<BmiRecentPage> {
  Box<BmiResult>? _bmiBox;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  @override
  void dispose() {
    // لا نغلق الـ box هنا لأنه قد يكون مستخدماً في أماكن أخرى
    super.dispose();
  }

  Future<void> _openBox() async {
    try {
      final box = await Hive.openBox<BmiResult>('bmi_results');
      _bmiBox = box;
      if (mounted) {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Color _getBmiColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.yellow;
    } else if (bmi >= 18.5 && bmi < 25) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  String _getBmiCategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal";
    } else if (bmi >= 25 && bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CenterBackAppBar(title: "BMI Recent Calculations"),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(3).of(context),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current BMI",
                  style: InsulinBoldFonts.smallBoldFont.copyWith(fontSize: 26),
                ),
                BlocBuilder<BmiCubit, BmiState>(
                  builder: (context, state) {
                    double bmiValue = 0;
                    if (state is BmiCalculated) {
                      bmiValue = state.bmi;
                    } else if (state is BmiSaved) {
                      bmiValue = state.bmi;
                    } else if (state is BmiSaveSuccess) {
                      bmiValue = state.bmi;
                    } else {
                      return Text(
                        "Not calculated",
                        style: InsulinBoldFonts.largeBoldFont.copyWith(
                          fontSize: 27,
                        ),
                      );
                    }

                    // تحديد اللون حسب قيمة BMI
                    Color bmiColor;
                    if (bmiValue < 18.5) {
                      bmiColor = Colors.yellow; // منخفض - أصفر
                    } else if (bmiValue >= 18.5 && bmiValue < 25) {
                      bmiColor = Colors.green; // متوسط/طبيعي - أخضر
                    } else {
                      bmiColor = Colors.red; // عالي - أحمر
                    }

                    return Text(
                      bmiValue.toStringAsFixed(2),
                      style: InsulinBoldFonts.largeBoldFont.copyWith(
                        fontSize: 27,
                        color: bmiColor,
                      ),
                    );
                  },
                ),
              ],
            ),
            VerticalSpace(3).of(context),
            // Text(DateFormat('MMM dd, yyyy').format(DateTime.now()), style: InsulinBoldFonts.smallBoldFont.copyWith(fontSize: 26),),
            Text(
              "Your Recent Calculations",
              style: InsulinBoldFonts.smallBoldFont.copyWith(fontSize: 20),
            ),
            VerticalSpace(1.2).of(context),

            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _bmiBox == null || _bmiBox!.isEmpty
                  ? const Center(
                      child: Text(
                        "No BMI calculations yet",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : Builder(
                      builder: (context) {
                        final bmiResults = _bmiBox!.values.toList();
                        // ترتيب حسب التاريخ (الأحدث أولاً)
                        bmiResults.sort((a, b) => b.date.compareTo(a.date));

                        return ListView.builder(
                          itemCount: bmiResults.length,
                          itemBuilder: (context, index) {
                            final bmiResult = bmiResults[index];
                            final dateFormat = DateFormat('MMM dd, yyyy');
                            final timeFormat = DateFormat('HH:mm');

                            return Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: _getBmiColor(bmiResult.bmi),
                                  child: Icon(
                                    Icons.monitor_weight,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(
                                  dateFormat.format(bmiResult.date),
                                  style: InsulinBoldFonts.smallBoldFont,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "State: ${_getBmiCategory(bmiResult.bmi)}",
                                      style: InsulinNormalFonts.smallFont14,
                                    ),
                                    Text(
                                      "Weight: ${bmiResult.weight}kg • Height: ${bmiResult.height}cm",
                                      style: InsulinNormalFonts.smallFont14,
                                    ),
                                    Text(
                                      "Time: ${timeFormat.format(bmiResult.date)}",
                                      style: InsulinNormalFonts.smallFont14,
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  bmiResult.bmi.toStringAsFixed(1),
                                  style: InsulinBoldFonts.smallBoldFont
                                      .copyWith(
                                        color: _getBmiColor(bmiResult.bmi),
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            );
                            // Card(
                            //   color: Colors.white,
                            //   margin: const EdgeInsets.symmetric(
                            //     horizontal: 15,
                            //     vertical: 5,
                            //   ),
                            //   child: ListTile(
                            //     leading: CircleAvatar(
                            //       backgroundColor: _getBmiColor(bmiResult.bmi),
                            //       child: Icon(
                            //         Icons.monitor_weight,
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //     title: Text(
                            //       dateFormat.format(bmiResult.date),
                            //       style: InsulinBoldFonts.smallBoldFont,
                            //     ),
                            //     subtitle: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text(
                            //           _getBmiCategory(bmiResult.bmi),
                            //           style: InsulinNormalFonts.smallFont14,
                            //         ),
                            //         Text(
                            //           "Weight: ${bmiResult.weight}kg • Height: ${bmiResult.height}cm",
                            //           style: InsulinNormalFonts.smallFont14
                            //               .copyWith(color: Colors.grey[600]),
                            //         ),
                            //         Text(
                            //           "Time: ${timeFormat.format(bmiResult.date)}",
                            //           style: InsulinNormalFonts.smallFont14
                            //               .copyWith(color: Colors.grey[600]),
                            //         ),
                            //       ],
                            //     ),
                            //     trailing: Text(
                            //       bmiResult.bmi.toStringAsFixed(1),
                            //       style: InsulinBoldFonts.smallBoldFont.copyWith(
                            //         color: _getBmiColor(bmiResult.bmi),
                            //         fontSize: 18,
                            //       ),
                            //     ),
                            //   ),
                            // );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
