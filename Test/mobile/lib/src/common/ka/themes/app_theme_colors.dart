import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class KaThemeColors {
  static const Color occur = Color(0xffb38220);
  static const Color peach = Color(0xffe09c5f);
  static const Color skyBlue = Color(0xff639fdc);
  static const Color darkGreen = Color(0xff226e79);
  static const Color red = Color(0xfff8575e);
  static const Color purple = Color(0xff9f50bf);
  static const Color pink = Color(0xffd17b88);
  static const Color brown = Color(0xffbd631a);
  static const Color blue = Color(0xff1a71bd);
  static const Color green = Color(0xff068425);
  static const Color yellow = Color(0xfffff44f);
  static const Color orange = Color(0xffFFA500);
  static const Color gray = Color.fromARGB(255, 211, 211, 208);
  static const Color white = Color.fromARGB(255, 252, 252, 252);
  static const Color black = Color.fromARGB(255, 0, 0, 0);

  static Color appBgColor = HexColor("#FFFFFF");


  final Color card,
      cardDark,
      border,
      borderDark,
      disabledColor,
      onDisabled,
      colorInfo,
      colorWarning,
      colorSuccess,
      colorError,
      shadowColor,
      onInfo,
      onWarning,
      onSuccess,
      onError,
      shimmerBaseColor,
      shimmerHighlightColor;

  final Color lightBlack, violet, indigo;

  final Color primary, secondary;

  KaThemeColors({
    this.border = const Color(0xffeeeeee),
    this.borderDark = const Color(0xffe6e6e6),
    this.card = const Color(0xfff0f0f0),
    this.cardDark = const Color(0xfffefefe),
    this.disabledColor = const Color(0xffdcc7ff),
    this.onDisabled = const Color(0xffffffff),
    this.colorWarning = const Color(0xffffc837),
    this.colorInfo = const Color(0xffff784b),
    this.colorSuccess = const Color(0xff3cd278),
    this.shadowColor = const Color(0xff1f1f1f),
    this.onInfo = const Color(0xffffffff),
    this.onWarning = const Color(0xffffffff),
    this.onSuccess = const Color(0xffffffff),
    this.colorError = const Color(0xfff0323c),
    this.onError = const Color(0xffffffff),
    this.shimmerBaseColor = const Color(0xFFF5F5F5),
    this.shimmerHighlightColor = const Color(0xFFE0E0E0),

    // Main Colors
    this.primary = const Color(0xFF34941C),
    this.secondary = const Color(0xFFFF1800),

    //Color
    this.lightBlack = const Color(0xffa7a7a7),
    this.indigo = const Color(0xff4B0082),
    this.violet = const Color(0xff9400D3),

  });

  //--------------------------------------  Custom App Theme ----------------------------------------//

  static final KaThemeColors lightCustomTheme = KaThemeColors(
      card: const Color(0xfff6f6f6),
      cardDark: const Color(0xfff0f0f0),
      disabledColor: const Color(0xff636363),
      onDisabled: const Color(0xffffffff),
      colorInfo: const Color(0xffff784b),
      colorWarning: const Color(0xffffc837),
      colorSuccess: const Color(0xff3cd278),
      shadowColor: const Color(0xffd9d9d9),
      onInfo: const Color(0xffffffff),
      onSuccess: const Color(0xffffffff),
      onWarning: const Color(0xffffffff),
      colorError: const Color(0xfff0323c),
      onError: const Color(0xffffffff),
      shimmerBaseColor: const Color(0xFFF5F5F5),
      shimmerHighlightColor: const Color(0xFFE0E0E0));

  static final KaThemeColors darkCustomTheme = KaThemeColors(
      card: const Color(0xff222327),
      cardDark: const Color(0xff101010),
      border: const Color(0xff303030),
      borderDark: const Color(0xff363636),
      disabledColor: const Color(0xffbababa),
      onDisabled: const Color(0xff000000),
      colorInfo: const Color(0xffff784b),
      colorWarning: const Color(0xffffc837),
      colorSuccess: const Color(0xff3cd278),
      shadowColor: const Color(0xff202020),
      onInfo: const Color(0xffffffff),
      onSuccess: const Color(0xffffffff),
      onWarning: const Color(0xffffffff),
      colorError: const Color(0xfff0323c),
      onError: const Color(0xffffffff),
      shimmerBaseColor: const Color(0xFF1a1a1a),
      shimmerHighlightColor: const Color(0xFF454545));
}