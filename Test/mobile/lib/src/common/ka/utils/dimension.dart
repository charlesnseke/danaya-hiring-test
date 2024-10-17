import 'package:flutter/material.dart';

class KaDeviceDimension {
  static late MediaQueryData _mediaQueryData;
  static late double height;
  static late double width;

  static init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    height = _mediaQueryData.size.height;
    width = _mediaQueryData.size.width;
  }

  /// Height Ratio
  static double ratio5 = height / 156;
  static double ratio8 = height / 97.5;
  static double ratio10 = height / 78;
  static double ratio12 = height / 65;
  static double ratio13 = height / 60;
  static double ratio14 = height / 55.71;
  static double ratio15 = height / 52;
  static double ratio16 = height / 48.75;
  static double ratio18 = height / 43.33;
  static double ratio20 = height / 39;
  static double ratio25 = height / 31.2;
  static double ratio30 = height / 26;
  static double ratio32 = height / 24.375;
  static double ratio34 = height / 22.94;
  static double ratio50 = height / 15.6;
  static double ratio55 = height / 14.18;
  static double ratio75 = height / 10.4;
  static double ratio100 = height / 7.8;

}