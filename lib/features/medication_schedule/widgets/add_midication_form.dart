import 'package:flutter/material.dart';

class AddMedicationForm extends StatefulWidget {
  final void Function(String name, String time, DateTime? endDate) onSave;

  const AddMedicationForm({super.key, required this.onSave});

  @override
  State<AddMedicationForm> createState() => _AddMedicationFormState();
}

class _AddMedicationFormState extends State<AddMedicationForm> {
  final TextEditingController _nameController = TextEditingController();
  TimeOfDay? _selectedTime;
  DateTime? _endDate;

  Future<void> _pickTime(BuildContext context) async {
    final pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  Future<void> _pickEndDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _endDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Add Medication",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: "Medicine Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          // وقت الدواء
          Row(
            children: [
              Expanded(
                child: Text(
                  _selectedTime == null
                      ? "No Time Selected"
                      : "Time: ${_selectedTime!.format(context)}",
                ),
              ),
              TextButton(
                onPressed: () => _pickTime(context),
                child: const Text("Pick Time"),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // تاريخ النهاية
          Row(
            children: [
              Expanded(
                child: Text(
                  _endDate == null
                      ? "No End Date Selected"
                      : "Until: ${_endDate!.day}/${_endDate!.month}/${_endDate!.year}",
                ),
              ),
              TextButton(
                onPressed: () => _pickEndDate(context),
                child: const Text("Pick End Date"),
              ),
            ],
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_nameController.text.isNotEmpty && _selectedTime != null) {
                widget.onSave(
                  _nameController.text,
                  _selectedTime!.format(context),
                  _endDate,
                );
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
