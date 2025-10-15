// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';
import 'package:insulin95/features/profile/widgets/name_and_email.dart';
import 'package:insulin95/features/profile/widgets/profile_image.dart';
import 'package:insulin95/features/profile/widgets/profile_statics.dart';
import 'package:insulin95/features/profile/widgets/setting_options.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text("Profile", style: InsulinBoldFonts.largeBoldFont),
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Center(
              child: Column(
                children: [
                  VerticalSpace(2).of(context),
                  ProfileImage(),
                  VerticalSpace(2.5).of(context),
                  NameAndEmail(),
                  VerticalSpace(2.3).of(context),
                  ProfileStatics(),
                  VerticalSpace(2).of(context),
                  SettingsOptionsItems(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
