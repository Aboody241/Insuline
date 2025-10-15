import 'package:flutter/material.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/home_medical_reminder.dart';
import 'package:insulin95/features/medication_schedule/medication_schedule_view.dart';

class ReminderWidgets extends StatelessWidget {
  const ReminderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MedicationScheduleView()),
            );
          },
          child: HomeMedicalRemider(
            title: "Insulin Injection",
            time: "null AM",
          ),
        ),
        HomeMedicalRemider(title: "Insulin Injection", time: "null AM"),
      ],
    );
  }
}
