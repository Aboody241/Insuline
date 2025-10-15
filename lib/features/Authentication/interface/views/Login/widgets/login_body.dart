import 'package:flutter/material.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/features/Authentication/interface/views/Login/widgets/create_account_text.dart';
import 'package:insulin95/features/Authentication/interface/views/Login/widgets/Login_components.dart';
import 'package:insulin95/features/Authentication/interface/views/Login/widgets/google_signin_button.dart';
import 'package:insulin95/features/Authentication/interface/views/Login/widgets/login_divider.dart';
import 'package:insulin95/features/Authentication/interface/views/Login/widgets/privacy_text.dart';
import 'package:insulin95/features/Authentication/interface/views/Login/widgets/sections/auth_section.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child:  Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  VerticalSpace(2).of(context),
                  const WelcomeObject(),
                  VerticalSpace(2).of(context),
                  const LoginLogoImage(),
                  const DscriptionObject(),
                  VerticalSpace(2).of(context),
                  //============
                  const AuthSection(),

                  //============
                  VerticalSpace(2.5).of(context),
                  const CreateAccountText(),
                  VerticalSpace(4).of(context),
                  const LoginDivider(title: 'Sign With'),
                  VerticalSpace(4).of(context),
                  const SocialGoogleSign(),
                  VerticalSpace(3).of(context),
                  const PrivacyText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
