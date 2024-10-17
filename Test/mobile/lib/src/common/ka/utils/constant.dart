import 'package:flutter/material.dart';

class KaConstantData {
  final double containerRadius;
  final double cardRadius;
  final double buttonRadius;

  KaConstantData({this.containerRadius = 8, this.cardRadius = 8, this.buttonRadius=8});
}

class KaConstant {
  static KaConstantData constant = KaConstantData();

  static setConstant(KaConstantData constantData) {
    constant = constantData;
  }


  static MaterialRadius buttonRadius =
  MaterialRadius(xs: 4, small: 8, medium: 16, large: 24);
  static MaterialRadius textFieldRadius =
  MaterialRadius(xs: 4, small: 8, medium: 16, large: 24);
  static MaterialRadius containerRadius =
  MaterialRadius(xs: 4, small: 8, medium: 16, large: 24);

  static ColorData softColors = ColorData();
}

class ColorData {
  final Color star = const Color(0xffFFC233);

  final ColorGroup pink = ColorGroup(const Color(0xffFFC2D9), const Color(0xffF5005E));
  final ColorGroup violet = ColorGroup(const Color(0xffD0BADE), const Color(0xff4E2E60));
  final ColorGroup blue = ColorGroup(const Color(0xffADD8FF), const Color(0xff004A8F));
  final ColorGroup green = ColorGroup(const Color(0xffAFE9DA), const Color(0xff165041));
  final ColorGroup orange = ColorGroup(const Color(0xffFFCEC2), const Color(0xffFF3B0A));

  final List<ColorGroup> list = [];

  ColorData() {
    list.addAll([pink, violet, blue, green, orange]);
  }
}

class ColorGroup {
  final Color color, onColor;

  ColorGroup(this.color, this.onColor);
}

class MaterialRadius {
  late double xs, small, medium, large;

  MaterialRadius(
      {this.xs = 4, this.small = 8, this.medium = 16, this.large = 24});
}