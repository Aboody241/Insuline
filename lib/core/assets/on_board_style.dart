import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart'; // مهم علشان TextStyle

abstract class OnBoardStyle {
  static final TextStyle onBoardTitle = GoogleFonts.lexend(
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
  static final TextStyle onBoardDisc = GoogleFonts.lexend(
    color: Colors.grey[600],
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
