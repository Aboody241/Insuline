import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'calculatebmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());

  void calculateBmi(double weight, double heightCm) {
    final heightM = heightCm / 100; // تحويل سم → متر
    final bmi = weight / (heightM * heightM);

    String category;
    if (bmi < 18.5) {
      category = "Underweight";
    } else if (bmi < 25) {
      category = "Normal";
    } else if (bmi < 30) {
      category = "Overweight";
    } else {
      category = "Obese";
    }

    emit(BmiCalculated(bmi, category));
  }
}
