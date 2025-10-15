import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/on_board_style.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
// ignore: camel_case_types
class forget_password_text extends StatelessWidget {
  const forget_password_text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: SizeConfig.defaultSize! * 23),
      child: Text(
        "Foget Password?",
        style: OnBoardStyle.onBoardDisc.copyWith(color: KtherdC),
      ),
    );
  }
}