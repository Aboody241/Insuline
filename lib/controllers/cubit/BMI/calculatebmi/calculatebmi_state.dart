part of 'calculatebmi_cubit.dart';

@immutable
abstract class BmiState {}

class BmiInitial extends BmiState {}


class BmiCalculated extends BmiState {
  final double bmi;
  final String category;

  BmiCalculated(this.bmi, this.category);
}


