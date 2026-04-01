// ignore_for_file: file_names, use_build_context_synchronously, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../navigation/navbar/nav_Bar.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    // بعد 3 ثواني يروح على الـ HomePage
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NavBar()),
      );
      // غير الـ route على حسبك
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/animations/welcome.json",
                width: 200,
                height: 200,
                repeat: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
