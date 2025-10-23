import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/data/models/medication_model.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/add_reminder_widget.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/feature_title.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/home_medical_reminder.dart';
import 'package:insulin95/features/medication_schedule/medication_schedule_view.dart';

class ReminderWidgets extends StatefulWidget {
  const ReminderWidgets({super.key});

  @override
  State<ReminderWidgets> createState() => _ReminderWidgetsState();
}

class _ReminderWidgetsState extends State<ReminderWidgets> {
  Box<Medication>? _medicationBox;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    try {
      final box = await Hive.openBox<Medication>('medications');
      _medicationBox = box;
      if (mounted) {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox.shrink();
    }

    if (_medicationBox == null) {
      return const SizedBox.shrink();
    }

    return ValueListenableBuilder<Box<Medication>>(
      valueListenable: _medicationBox!.listenable(),
      builder: (context, medsBox, _) {
        // الحصول على الأدوية الحالية
        final medications = medsBox.values.toList();

        // إذا لم تكن هناك أدوية، نعرض رسالة
        if (medications.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FeaturesTitle(featureTitle: 'Medication Reminders'),
              VerticalSpace(0.5).of(context),
              AddReminderWidget(),
            ],
          );
        }

        // عرض الأدوية (حد أقصى 3 أدوية في الصفحة الرئيسية)
        final medicationsToShow = medications.take(3).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(0.5).of(context),
            ...medicationsToShow.map((medication) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MedicationScheduleView(),
                    ),
                  );
                },
                child: HomeMedicalRemider(
                  title: medication.name,
                  time: medication.time,
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }
}
