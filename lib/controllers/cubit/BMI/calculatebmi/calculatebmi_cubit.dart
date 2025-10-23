import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:insulin95/data/models/bmi_result_model.dart';

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

    emit(BmiCalculated(bmi, category, weight, heightCm));
  }

  Future<void> saveBmiResult(double bmi, String category, double weight, double height) async {
    try {
      final box = await Hive.openBox<BmiResult>('bmi_results');
      
      // حفظ النتيجة الجديدة (بدون حذف السابقة)
      final bmiResult = BmiResult(
        bmi: bmi,
        category: category,
        date: DateTime.now(),
        weight: weight,
        height: height,
      );
      
      await box.add(bmiResult);
      
      // تحديث الحالة لتظهر النتيجة المحفوظة
      emit(BmiSaveSuccess(bmi, category, weight, height));
    } catch (e) {
      emit(BmiError('Failed to save BMI result: $e'));
    }
  }

  Future<void> loadSavedBmi() async {
    try {
      final box = await Hive.openBox<BmiResult>('bmi_results');
      
      if (box.isNotEmpty) {
        // الحصول على أحدث نتيجة (آخر إضافة)
        final savedBmi = box.values.last;
        emit(BmiSaveSuccess(savedBmi.bmi, savedBmi.category, savedBmi.weight, savedBmi.height));
      }
    } catch (e) {
      // لا نفعل شيء إذا لم تكن هناك نتائج محفوظة
    }
  }
}
