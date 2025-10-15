import 'package:flutter/widgets.dart';

class VerticalSpace {
  final double value;
  VerticalSpace(this.value);
  Widget of(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * value / 100);
  }
}

//------------------
class HorizentalSpace {
  final double value;
  HorizentalSpace(this.value);
  Widget of(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.width * value / 100);
  }
}
//-----------------

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * .024
        : screenWidth! * .024;
  }
}

//-----------------
class ClassName {
  final int value;

  ClassName(this.value);

  Widget of(BuildContext context) {
    return Text("data");
  }
}
