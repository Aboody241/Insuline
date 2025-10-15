// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';
import 'package:insulin95/core/widgets/custom_buttons.dart';
import 'package:insulin95/data/models/medication_model.dart';
import 'package:insulin95/features/medication_schedule/widgets/add_midication_form.dart';

class MedicationBody extends StatefulWidget {
  const MedicationBody({super.key});

  @override
  State<MedicationBody> createState() => _MedicationBodyState();
}

class _MedicationBodyState extends State<MedicationBody> {
  late Box<Medication> medicationBox;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    medicationBox = await Hive.openBox<Medication>('medications');
    _checkExpiredMedications();
    setState(() {});
  }

  void _checkExpiredMedications() {
    for (var med in medicationBox.values.toList()) {
      if (med.endDate != null && DateTime.now().isAfter(med.endDate!)) {
        med.delete(); // مسح الأدوية اللي انتهت مدتها
      }
    }
  }

  void _openAddMedicationForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return AddMedicationForm(
          onSave: (name, time, endDate) async {
            final medication = Medication(
              name: name,
              time: time,
              endDate: endDate,
            );
            await medicationBox.add(medication);
            Navigator.pop(context);
            setState(() {});
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CenterBackAppBar(title: "Medication Schedule"),
      body: Column(
        children: [
          Expanded(
            child: medicationBox.isEmpty
                ? const Center(
                    child: Text(
                      "No medications added yet",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: medicationBox.length,
                    itemBuilder: (context, index) {
                      final med = medicationBox.getAt(index)!;
                      return ListTile(
                        minVerticalPadding: 10,
                        leading: SizedBox(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            "assets/icons/medication_icon.svg",
                          ),
                        ),
                        title: Text(
                          med.name,
                          style: InsulinNormalFonts.meduimNormalFont,
                        ),
                        subtitle: Text(
                          "${med.time} • Until: ${med.endDate != null ? "${med.endDate!.day}/${med.endDate!.month}/${med.endDate!.year}" : "Not set"}",
                          style: TextFontStyleSecColor.smallFont,
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.rightSlide,
                              title: 'Warning !',
                              desc: 'Make Sure if You Want to Delete it.',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () async {
                                await med.delete();
                                setState(() {});
                              },
                            ).show();
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 25,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
            child: CustomButton1(
              color: KprimaryC,
              title: "Add New Medication",
              titleColor: KwhiteC,
              ontap: _openAddMedicationForm,
            ),
          ),
        ],
      ),
    );
  }
}
