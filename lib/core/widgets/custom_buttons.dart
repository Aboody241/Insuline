import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton1 extends StatelessWidget {
  final Color color;
  final dynamic title;
  final dynamic ontap;
  final Color titleColor;
  const CustomButton1({
    super.key,
    required this.color,
    required this.title,
    this.ontap,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.lexend(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: titleColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final Color color;
  final String title;
  final dynamic ontap;
  final Color titleColor;
  final EdgeInsets padd;
  const CustomButton2({
    super.key,
    required this.color,
    required this.title,
    this.ontap,
    required this.titleColor, required this.padd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: padd,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.lexend(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: titleColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton3 extends StatelessWidget {
  final Color color;
  final dynamic ontap;
  final Color titleColor;
  final EdgeInsets padd;
  final Widget child;
  const CustomButton3({
    super.key,
    required this.color,
    this.ontap,
    required this.titleColor, required this.padd, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: padd,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: color,
        ),
        child: Center(
          child: child
        ),
      ),
    );
  }
}
