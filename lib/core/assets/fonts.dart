import 'package:flutter/widgets.dart';
import 'package:insulin95/core/assets/colors.dart';

abstract class FontGoogleStyle {
  static final appBar = TextStyle(fontSize: 23, fontWeight: FontWeight.w600);
}
//=====================================================

abstract class TextFontStyle {
  static final largeFont = TextStyle(fontSize: 25, fontWeight: FontWeight.w500);
  static final meduimFont = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final smallFont = TextStyle(fontSize: 16);
}

//=====================================================

abstract class TextFontStyleSecColor {
  static final largeFont = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: KtherdC,
  );
  static final meduimFont = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: KtherdC,
  );
  static final smallFont = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: KtherdC,
  );
}
//=====================================================

abstract class InsulinBoldFonts {
  static final largeBoldFont = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.bold,
  );

  static final meduimBoldFont18 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final smallBoldFont = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

//=====================================================

abstract class InsulinNormalFonts {
  static final meduimNormalFont = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final smallFont14 = TextStyle(fontSize: 16);
  static final smallFont16 = TextStyle(fontSize: 18);
}

abstract class InsulinSmallFonts {
  static final meduimNormalFont = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final smallFont14 = TextStyle(fontSize: 14);
  static final smallFont16 = TextStyle(fontSize: 18);
}
