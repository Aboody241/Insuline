import 'package:flutter/material.dart'; // مهم علشان TextStyle

abstract class OnBoardStyle {
  static final TextStyle onBoardTitle = const TextStyle(
    fontFamily: 'Lexend',
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
  static final TextStyle onBoardDisc = const TextStyle(
    fontFamily: 'Lexend',
    color: Colors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
