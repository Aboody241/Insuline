import 'package:hive/hive.dart';

part 'bmi_result_model.g.dart';

@HiveType(typeId: 2)
class BmiResult extends HiveObject {
  @HiveField(0)
  double bmi;

  @HiveField(1)
  String category;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  double weight;

  @HiveField(4)
  double height;

  BmiResult({
    required this.bmi,
    required this.category,
    required this.date,
    required this.weight,
    required this.height,
  });
}
