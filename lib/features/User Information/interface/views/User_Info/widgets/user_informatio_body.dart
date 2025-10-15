import 'package:flutter/material.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';
import 'package:insulin95/features/User%20Information/interface/views/User_Info/sections/forms_section.dart';
import 'package:insulin95/features/User%20Information/interface/views/User_Info/widgets/submet_button.dart';
import 'package:insulin95/features/User%20Information/interface/views/User_Info/widgets/user_checker.dart';

class UserInformationBody extends StatefulWidget {
  const UserInformationBody({super.key});

  @override
  State<UserInformationBody> createState() => _UserInformationBodyState();
}

class _UserInformationBodyState extends State<UserInformationBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //================================================
      appBar: BackAppBar(title: "Diabetes Informations"),
      //================================================
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  //============================Age
                  const AgeForm(),
                  const GenderForm(),
                  const DiabetesType(),
                  const DiabetesYears(),
                  const ActivityLevelForm(),
                  VerticalSpace(2).of(context),
                  const UserChecks(title: "Family history of diabetes"),
                  VerticalSpace(2).of(context),
                  const UserChecks(title: "Taking insulin"),
                  VerticalSpace(10).of(context),
                  const SubmetButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
