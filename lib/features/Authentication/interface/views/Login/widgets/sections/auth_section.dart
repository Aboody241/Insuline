// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/core/widgets/All_Forms.dart';
import 'package:insulin95/core/widgets/custom_buttons.dart';
import 'package:insulin95/data/services/firebase/auth_service.dart';
import 'package:insulin95/features/Authentication/interface/views/Login/widgets/foget_password_text.dart';
import 'package:insulin95/features/User%20Welcome/welocomePage.dart';

class AuthSection extends StatefulWidget {
  const AuthSection({super.key});

  @override
  State<AuthSection> createState() => _AuthSectionState();
}

class _AuthSectionState extends State<AuthSection> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthService _authService = AuthService();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
          suffixIcon: const Icon(Icons.email_outlined, color: KtherdC),
          textHint: "Email",
        ),
        CustomPasswordField(
          controller: passwordController,
          hintText: "Password",
        ),
        VerticalSpace(1).of(context),
        const forget_password_text(),
        VerticalSpace(3).of(context),

        _isLoading
            ? const CircularProgressIndicator()
            : CustomButton1(
                color: KprimaryC,
                title: "Login",
                titleColor: KwhiteC,
                ontap: () async {
                  setState(() => _isLoading = true);

                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();

                  final errorMessage = await _authService.signIn(
                    email,
                    password,
                  );

                  setState(() => _isLoading = false);

                  if (errorMessage == null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(errorMessage.toString()),
                      ), // 💡 مهم
                    );
                  }
                },
              ),
      ],
    );
  }
}
