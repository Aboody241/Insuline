
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/on_board_style.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';

class SocialGoogleSign extends StatelessWidget {
  const SocialGoogleSign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: KgrayC)
        ),
        child: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/logos/icons8-google.svg",width: 30,height: 30,),
            HorizentalSpace(2).of(context),
            Text("Log In with Google" , style: OnBoardStyle.onBoardDisc.copyWith(color: KblackC),)
          ],
        )),
      ),
    );
  }
}