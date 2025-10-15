import 'package:hive/hive.dart';

part 'medication_model.g.dart'; // ده اللي هيولد

@HiveType(typeId: 1)
class Medication extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String time;

  @HiveField(2)
  DateTime? endDate;

  Medication({
    required this.name,
    required this.time,
    this.endDate,
  });
}
