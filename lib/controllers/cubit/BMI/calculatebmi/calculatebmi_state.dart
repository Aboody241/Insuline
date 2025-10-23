part of 'calculatebmi_cubit.dart';

@immutable
abstract class BmiState {}

class BmiInitial extends BmiState {}


class BmiCalculated extends BmiState {
  final double bmi;
  final String category;
  final double weight;
  final double height;

  BmiCalculated(this.bmi, this.category, this.weight, this.height);
}

class BmiSaved extends BmiState {
  final double bmi;
  final String category;
  final double weight;
  final double height;

  BmiSaved(this.bmi, this.category, this.weight, this.height);
}

class BmiError extends BmiState {
  final String message;

  BmiError(this.message);
}

class BmiSaveSuccess extends BmiState {
  final double bmi;
  final String category;
  final double weight;
  final double height;

  BmiSaveSuccess(this.bmi, this.category, this.weight, this.height);
}


