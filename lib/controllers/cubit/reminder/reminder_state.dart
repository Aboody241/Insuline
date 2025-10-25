// lib/features/home/features/home_page_feature/logic/reminder_state.dart
import 'package:equatable/equatable.dart';
import 'package:insulin95/data/models/medication_model.dart';

abstract class ReminderState extends Equatable {
  const ReminderState();
  @override
  List<Object?> get props => [];
}

class ReminderLoading extends ReminderState {
  const ReminderLoading();
}

class ReminderEmpty extends ReminderState {
  const ReminderEmpty();
}

class ReminderLoaded extends ReminderState {
  final List<Medication> medications;
  const ReminderLoaded(this.medications);

  @override
  List<Object?> get props => [medications];
}

class ReminderError extends ReminderState {
  final String message;
  const ReminderError(this.message);

  @override
  List<Object?> get props => [message];
}
