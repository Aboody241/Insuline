import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/widgets/custom_buttons.dart';
import 'package:insulin95/features/User%20Information/interface/views/User_photo_userName/user_photo_view.dart';

class SubmetButton extends StatelessWidget {
  const SubmetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton1(
      color: KprimaryC,
      title: "Next",
      titleColor: Colors.white,
      ontap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => UserPhotoView(),
          ),
        );
      },
    );
  }
}
