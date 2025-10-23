// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

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
  Box<Medication>? _medicationBox;
  bool _opening = true;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    // Ensure Hive is initialized somewhere in app startup (Hive.initFlutter()).
    final box = await Hive.openBox<Medication>('medications');
    _medicationBox = box;
    await _checkExpiredMedications(box);
    if (!mounted) return;
    setState(() => _opening = false);
  }

  Future<void> _checkExpiredMedications(Box<Medication> box) async {
    final now = DateTime.now();
    // toList() so we don't mutate while iterating
    final meds = box.values.toList();
    for (final med in meds) {
      final end = med.endDate;
      if (end != null && now.isAfter(end)) {
        await med.delete();
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
            final medication = Medication(name: name, time: time, endDate: endDate);
            await _medicationBox?.add(medication);
            if (mounted) Navigator.pop(context);
            // No need to setState if we use ValueListenableBuilder
          },
        );
      },
    );
  }

  @override
  void dispose() {
    // Optional: keep box open app-wide. If this screen owns it, close here.
    _medicationBox?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dateFmt = DateFormat('dd/MM/yyyy');

    if (_opening) {
      return const Scaffold(
        appBar: CenterBackAppBar(title: "Medication Schedule"),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final box = _medicationBox!;
    return Scaffold(
      appBar: const CenterBackAppBar(title: "Medication Schedule"),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder<Box<Medication>>(
              valueListenable: box.listenable(),
              builder: (context, medsBox, _) {
                if (medsBox.isEmpty) {
                  return const Center(
                    child: Text(
                      "No medications added yet",
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: medsBox.length,
                  itemBuilder: (context, index) {
                    final med = medsBox.getAt(index);
                    if (med == null) return const SizedBox.shrink();

                    final until = med.endDate != null
                        ? dateFmt.format(med.endDate!)
                        : "Not set";

                    return ListTile(
                      minVerticalPadding: 10,
                      leading: SizedBox(
                        height: 27,
                        width: 27,
                        child: SvgPicture.asset("assets/icons/medication_icon.svg"),
                      ),
                      title: Text(med.name, style: InsulinNormalFonts.meduimNormalFont),
                      subtitle: Text(
                        "${med.time} • Until: $until",
                        style: TextFontStyleSecColor.smallFont,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.rightSlide,
                            title: 'Warning !',
                            desc: 'Make sure you want to delete it.',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () async {
                              await med.delete();
                              // ValueListenableBuilder will refresh; no setState needed
                            },
                          ).show();
                          // ❌ Remove the extra setState() here
                        },
                        icon: const Icon(Icons.delete, size: 25, color: Colors.red),
                      ),
                    );
                  },
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
