
import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/custom_buttons.dart';
import 'package:insulin95/features/User%20Information/interface/views/User_Info/user_information_view.dart';
import 'package:page_transition/page_transition.dart';

class BMIActions extends StatelessWidget {
  const BMIActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton1(
          color: KprimaryC,
          title: "Calculate",
          titleColor: Colors.white,
          ontap: () {},
        ),
        VerticalSpace(2).of(context),
        CustomButton1(
          color: KsecondaryC,
          title: "Next",
          titleColor: KblackC,
          ontap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: UserInformationView(),
              ),
            );
          },
        ),
      ],
    );
  }
}
