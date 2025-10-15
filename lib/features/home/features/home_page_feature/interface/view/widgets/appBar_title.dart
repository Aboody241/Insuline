// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/features/home/features/home_page_feature/interface/view/widgets/notifications_button.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Insulin App", style: InsulinBoldFonts.meduimBoldFont18),
        NotificationsButton(),
      ],
    );
  }
}
