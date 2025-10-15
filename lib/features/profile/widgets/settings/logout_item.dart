import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/features/Authentication/interface/views/Login/login_page_view.dart';

class LogoutItem extends StatelessWidget {
  const LogoutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.rightSlide,
          title: 'Notic',
          desc: 'Are You Sure to Log Out ?',
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPageView()),
            );
          },
        ).show();
      },
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
            decoration: BoxDecoration(
              color: KsecondaryC,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(Icons.logout_rounded, size: 32),
          ),
          HorizentalSpace(5).of(context),

          Text("Logout", style: InsulinNormalFonts.smallFont16),
        ],
      ),
    );
  }
}
