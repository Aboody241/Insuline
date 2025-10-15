import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/features/profile/widgets/settings/change_password_item.dart';
import 'package:insulin95/features/profile/widgets/settings/edit_profile_item.dart';
import 'package:insulin95/features/profile/widgets/settings/logout_item.dart';
import 'package:insulin95/features/profile/widgets/settings/privacy_item.dart';

class SettingsOptionsItems extends StatelessWidget {
  const SettingsOptionsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HorizentalSpace(3.5).of(context),
          Text("Settings & Account", style: InsulinBoldFonts.largeBoldFont),
          VerticalSpace(3).of(context),

          EditProfile(),

          VerticalSpace(2).of(context),

          ChangePasswordItem(),

          VerticalSpace(2).of(context),

          PrivacyItem(),

          VerticalSpace(2).of(context),

          LogoutItem(),

          VerticalSpace(2).of(context),
        ],
      ),
    );
  }
}
