// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_result_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BmiResultAdapter extends TypeAdapter<BmiResult> {
  @override
  final int typeId = 2;

  @override
  BmiResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BmiResult(
      bmi: fields[0] as double,
      category: fields[1] as String,
      date: fields[2] as DateTime,
      weight: fields[3] as double,
      height: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BmiResult obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.bmi)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BmiResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
