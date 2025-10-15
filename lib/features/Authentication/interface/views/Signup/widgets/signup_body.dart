import 'package:flutter/material.dart';

import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/on_board_style.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/All_Forms.dart';
import 'package:insulin95/core/widgets/custom_app_bar.dart';
import 'package:insulin95/core/widgets/custom_buttons.dart';
import 'package:insulin95/data/services/firebase/auth_service.dart';
import 'package:insulin95/features/Authentication/interface/views/Login/widgets/google_signin_button.dart';
import 'package:insulin95/features/Authentication/interface/views/Login/widgets/login_divider.dart';
import 'package:insulin95/features/Authentication/interface/views/Login/widgets/privacy_text.dart';
import 'package:insulin95/features/User%20Information/interface/views/Bmi_caculate/bmi_calculator_view.dart';

class SignupBody extends StatelessWidget {
  SignupBody({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ignore: unused_field
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(title: "Back"),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  // LoginLogoImage(),
                  VerticalSpace(3).of(context),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Create Account",
                          style: OnBoardStyle.onBoardTitle.copyWith(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                  VerticalSpace(3).of(context),

                  CustomTextField(
                    controller: emailController,

                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: Icon(Icons.email_outlined, color: KtherdC),
                    textHint: "Email Address",
                  ),
                  PhoneNoFiled(),
                  CustomPasswordField(
                    controller: passwordController,

                    hintText: "Pssword",
                  ),
                  CustomPasswordField(hintText: "Confirm Password"),
                  VerticalSpace(3).of(context),
                  CustomButton1(
                    ontap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => BmiCalculatorView(),
                        ),
                      );
                    },
                    color: KprimaryC,
                    title: "Signup",
                    titleColor: Colors.white,
                  ),
                  VerticalSpace(5).of(context),
                  LoginDivider(title: "SignUp With"),
                  VerticalSpace(2).of(context),
                  SocialGoogleSign(),
                  VerticalSpace(2).of(context),
                  PrivacyText(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
