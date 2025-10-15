import 'package:flutter/material.dart';
import 'package:insulin95/core/widgets/All_Forms.dart';



//====================================================



class GenderForm extends StatelessWidget {
  const GenderForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChoicerForm(options: ["Male", "Female"], hint: "Gender");
  }
}



//=====================================================



class AgeForm extends StatelessWidget {
  const AgeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicFormField(textHint: "Age", keyboardType: TextInputType.number);
  }
}



//=====================================================



class DiabetesYears extends StatelessWidget {
  const DiabetesYears({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicFormField(
      textHint: "Years with diabetes",
      keyboardType: TextInputType.number,
    );
  }
}


//=====================================================



class ActivityLevelForm extends StatelessWidget {
  const ActivityLevelForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoicerForm(
      options: ["Hight", "Meduim", "Low"],
      hint: "Activity  level",
    );
  }
}


//=====================================================



class DiabetesType extends StatelessWidget {
  const DiabetesType({super.key});

  @override
  Widget build(BuildContext context) {
    return ChoicerForm(
      options: [
        "Type 1 Diabetes",
        "Type 2 Diabetes",
        "Gestational Diabetes",
        "MODY",
        "LADA",
      ],
      hint: "Diabetes Type",
    );
  }
}
