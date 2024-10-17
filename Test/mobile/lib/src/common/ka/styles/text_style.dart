import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/app_theme.dart';

enum KaTextType {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

class KaTextStyle {
  static Function _fontFamily = GoogleFonts.poppins;

  static Map<int, FontWeight> _defaultFontWeight = {
    100: FontWeight.w100,
    200: FontWeight.w200,
    300: FontWeight.w300,
    400: FontWeight.w300,
    500: FontWeight.w400,
    600: FontWeight.w500,
    700: FontWeight.w600,
    800: FontWeight.w700,
    900: FontWeight.w800,
  };

  static Map<KaTextType, double> _defaultTextSize = {
    KaTextType.displayLarge: 57,
    KaTextType.displayMedium: 45,
    KaTextType.displaySmall: 36,
    KaTextType.headlineLarge: 32,
    KaTextType.headlineMedium: 28,
    KaTextType.headlineSmall: 26,
    KaTextType.titleLarge: 22,
    KaTextType.titleMedium: 16,
    KaTextType.titleSmall: 14,
    KaTextType.labelLarge: 14,
    KaTextType.labelMedium: 12,
    KaTextType.labelSmall: 11,
    KaTextType.bodyLarge: 16,
    KaTextType.bodyMedium: 14,
    KaTextType.bodySmall: 12,
  };

  static Map<KaTextType, int> _defaultTextFontWeight = {
    KaTextType.displayLarge: 500,
    KaTextType.displayMedium: 500,
    KaTextType.displaySmall: 500,
    KaTextType.headlineLarge: 500,
    KaTextType.headlineMedium: 500,
    KaTextType.headlineSmall: 500,
    KaTextType.titleLarge: 500,
    KaTextType.titleMedium: 500,
    KaTextType.titleSmall: 500,
    KaTextType.labelLarge: 600,
    KaTextType.labelMedium: 600,
    KaTextType.labelSmall: 600,
    KaTextType.bodyLarge: 500,
    KaTextType.bodyMedium: 500,
    KaTextType.bodySmall: 500,
  };

  static Map<KaTextType, double> _defaultLetterSpacing = {
    KaTextType.displayLarge: -0.25,
    KaTextType.displayMedium: 0,
    KaTextType.displaySmall: 0,
    KaTextType.headlineLarge: -0.2,
    KaTextType.headlineMedium: -0.15,
    KaTextType.headlineSmall: 0,
    KaTextType.titleLarge: 0,
    KaTextType.titleMedium: 0.1,
    KaTextType.titleSmall: 0.1,
    KaTextType.labelLarge: 0.1,
    KaTextType.labelMedium: 0.5,
    KaTextType.labelSmall: 0.5,
    KaTextType.bodyLarge: 0.5,
    KaTextType.bodyMedium: 0.25,
    KaTextType.bodySmall: 0.4,
  };

  static TextStyle getStyle({
    TextStyle? textStyle,
    int? fontWeight = 500,
    bool muted = false,
    bool xMuted = false,
    double letterSpacing = 0.15,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    double? finalFontSize =
        fontSize ?? (textStyle == null ? 40 : textStyle.fontSize);

    Color? finalColor;
    if (color == null) {
      Color themeColor =
          KaTheme.getThemeFromThemeMode().colorScheme.onSurface;
      finalColor = xMuted
          ? themeColor.withAlpha(160)
          : (muted ? themeColor.withAlpha(200) : themeColor);
    } else {
      finalColor = xMuted
          ? color.withAlpha(160)
          : (muted ? color.withAlpha(200) : color);
    }

    return _fontFamily(
        fontSize: finalFontSize,
        fontWeight: _defaultFontWeight[fontWeight] ?? FontWeight.w400,
        letterSpacing: letterSpacing,
        color: finalColor,
        decoration: decoration,
        height: height,
        wordSpacing: wordSpacing);
  }

  // Material Design 3
  static TextStyle displayLarge({
    TextStyle? textStyle,
    int fontWeight = 500,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[KaTextType.displayLarge],
        color: color,
        height: height,
        muted: muted,
        letterSpacing: letterSpacing ??
            _defaultLetterSpacing[KaTextType.displayLarge] ??
            -0.2,
        fontWeight: _defaultTextFontWeight[KaTextType.displayLarge] ?? 500,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle displayMedium(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
      fontSize: fontSize ?? _defaultTextSize[KaTextType.displayMedium],
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing ??
          _defaultLetterSpacing[KaTextType.displayMedium] ??
          -0.2,
      fontWeight: _defaultTextFontWeight[KaTextType.displayMedium] ?? 500,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle displaySmall({
    TextStyle? textStyle,
    int fontWeight = 500,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      fontSize: fontSize ?? _defaultTextSize[KaTextType.displaySmall],
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing ??
          _defaultLetterSpacing[KaTextType.displaySmall] ??
          -0.2,
      fontWeight: _defaultTextFontWeight[KaTextType.displaySmall] ?? 500,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle headlineLarge({
    TextStyle? textStyle,
    int fontWeight = 500,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      fontSize: fontSize ?? _defaultTextSize[KaTextType.headlineLarge],
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing ??
          _defaultLetterSpacing[KaTextType.headlineLarge] ??
          -0.2,
      fontWeight: _defaultTextFontWeight[KaTextType.headlineLarge] ?? 500,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle headlineMedium(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[KaTextType.headlineMedium],
        color: color,
        height: height,
        muted: muted,
        letterSpacing: letterSpacing ??
            _defaultLetterSpacing[KaTextType.headlineMedium] ??
            -0.15,
        fontWeight: _defaultTextFontWeight[KaTextType.headlineMedium] ?? 500,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle headlineSmall(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[KaTextType.headlineSmall],
        color: color,
        height: height,
        muted: muted,
        letterSpacing: letterSpacing ??
            _defaultLetterSpacing[KaTextType.headlineSmall] ??
            -0.15,
        fontWeight: _defaultTextFontWeight[KaTextType.headlineSmall] ?? 500,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle titleLarge(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[KaTextType.titleLarge],
        color: color,
        height: height,
        muted: muted,
        letterSpacing: letterSpacing ??
            _defaultLetterSpacing[KaTextType.titleLarge] ??
            -0.15,
        fontWeight: _defaultTextFontWeight[KaTextType.titleLarge] ?? 500,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle titleMedium(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[KaTextType.titleMedium],
        color: color,
        height: height,
        muted: muted,
        letterSpacing: letterSpacing ??
            _defaultLetterSpacing[KaTextType.titleMedium] ??
            -0.15,
        fontWeight: _defaultTextFontWeight[KaTextType.titleMedium] ?? 500,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle titleSmall(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[KaTextType.titleSmall],
        color: color,
        height: height,
        muted: muted,
        letterSpacing: letterSpacing ??
            _defaultLetterSpacing[KaTextType.titleSmall] ??
            -0.15,
        fontWeight: _defaultTextFontWeight[KaTextType.titleSmall] ?? 500,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle labelLarge(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[KaTextType.labelLarge],
        color: color,
        height: height,
        muted: muted,
        letterSpacing: letterSpacing ??
            _defaultLetterSpacing[KaTextType.labelLarge] ??
            -0.15,
        fontWeight: _defaultTextFontWeight[KaTextType.labelLarge] ?? 500,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle labelMedium(
      {TextStyle? textStyle,
      int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double? letterSpacing,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[KaTextType.labelMedium],
        color: color,
        height: height,
        muted: muted,
        letterSpacing: letterSpacing ??
            _defaultLetterSpacing[KaTextType.labelMedium] ??
            -0.15,
        fontWeight: _defaultTextFontWeight[KaTextType.labelMedium] ?? 500,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static TextStyle labelSmall({
    TextStyle? textStyle,
    int fontWeight = 500,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      fontSize: fontSize ?? _defaultTextSize[KaTextType.labelSmall],
      color: color,
      height: height,
      muted: muted,
      letterSpacing: letterSpacing ??
          _defaultLetterSpacing[KaTextType.labelSmall] ??
          -0.15,
      fontWeight: _defaultTextFontWeight[KaTextType.labelSmall] ?? 500,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle bodyLarge({
    TextStyle? textStyle,
    int? fontWeight,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      fontSize: fontSize ?? _defaultTextSize[KaTextType.bodyLarge],
      color: color,
      height: height,
      muted: muted,
      letterSpacing:
          letterSpacing ?? _defaultLetterSpacing[KaTextType.bodyLarge] ?? 0.15,
      fontWeight:
          fontWeight ?? _defaultTextFontWeight[KaTextType.bodyLarge] ?? 500,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle bodyMedium({
    TextStyle? textStyle,
    int fontWeight = 500,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      fontSize: fontSize ?? _defaultTextSize[KaTextType.bodyMedium],
      color: color,
      height: height,
      muted: muted,
      letterSpacing:
          letterSpacing ?? _defaultLetterSpacing[KaTextType.bodyMedium] ?? 0.15,
      fontWeight: _defaultTextFontWeight[KaTextType.bodyMedium] ?? 500,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static TextStyle bodySmall({
    TextStyle? textStyle,
    int fontWeight = 500,
    bool muted = false,
    bool xMuted = false,
    double? letterSpacing,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
  }) {
    return getStyle(
      fontSize: fontSize ?? _defaultTextSize[KaTextType.bodySmall],
      color: color,
      height: height,
      muted: muted,
      letterSpacing:
          letterSpacing ?? _defaultLetterSpacing[KaTextType.bodySmall] ?? 0.15,
      fontWeight: _defaultTextFontWeight[KaTextType.bodySmall] ?? 500,
      decoration: decoration,
      textStyle: textStyle,
      wordSpacing: wordSpacing,
      xMuted: xMuted,
    );
  }

  static void changeFontFamily(Function fontFamily) {
    KaTextStyle._fontFamily = fontFamily;
  }

  static void changeDefaultFontWeight(Map<int, FontWeight> defaultFontWeight) {
    KaTextStyle._defaultFontWeight = defaultFontWeight;
  }

  static void changeDefaultTextSize(Map<KaTextType, double> defaultTextSize) {
    KaTextStyle._defaultTextSize = defaultTextSize;
  }

  static Map<KaTextType, double> get defaultTextSize => _defaultTextSize;

  static Map<KaTextType, double> get defaultLetterSpacing =>
      _defaultLetterSpacing;

  static Map<KaTextType, int> get defaultTextFontWeight =>
      _defaultTextFontWeight;

  static Map<int, FontWeight> get defaultFontWeight => _defaultFontWeight;

  //-------------------Reset Font Styles---------------------------------
  static resetFontStyles() {
    _defaultFontWeight = {
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w300,
      500: FontWeight.w400,
      600: FontWeight.w500,
      700: FontWeight.w600,
      800: FontWeight.w700,
      900: FontWeight.w800,
    };

    _defaultTextSize = {
      KaTextType.displayLarge: 57,
      KaTextType.displayMedium: 45,
      KaTextType.displaySmall: 36,
      KaTextType.headlineLarge: 32,
      KaTextType.headlineMedium: 28,
      KaTextType.headlineSmall: 26,
      KaTextType.titleLarge: 22,
      KaTextType.titleMedium: 16,
      KaTextType.titleSmall: 14,
      KaTextType.labelLarge: 14,
      KaTextType.labelMedium: 12,
      KaTextType.labelSmall: 11,
      KaTextType.bodyLarge: 16,
      KaTextType.bodyMedium: 14,
      KaTextType.bodySmall: 12,
    };

    _defaultTextFontWeight = {
      KaTextType.displayLarge: 500,
      KaTextType.displayMedium: 500,
      KaTextType.displaySmall: 500,
      KaTextType.headlineLarge: 500,
      KaTextType.headlineMedium: 500,
      KaTextType.headlineSmall: 500,
      KaTextType.titleLarge: 500,
      KaTextType.titleMedium: 500,
      KaTextType.titleSmall: 500,
      KaTextType.labelLarge: 600,
      KaTextType.labelMedium: 600,
      KaTextType.labelSmall: 600,
      KaTextType.bodyLarge: 500,
      KaTextType.bodyMedium: 500,
      KaTextType.bodySmall: 500,
    };

    _defaultLetterSpacing = {
      KaTextType.displayLarge: -0.25,
      KaTextType.displayMedium: 0,
      KaTextType.displaySmall: 0,
      KaTextType.headlineLarge: -0.2,
      KaTextType.headlineMedium: -0.15,
      KaTextType.headlineSmall: 0,
      KaTextType.titleLarge: 0,
      KaTextType.titleMedium: 0.1,
      KaTextType.titleSmall: 0.1,
      KaTextType.labelLarge: 0.1,
      KaTextType.labelMedium: 0.5,
      KaTextType.labelSmall: 0.5,
      KaTextType.bodyLarge: 0.5,
      KaTextType.bodyMedium: 0.25,
      KaTextType.bodySmall: 0.4,
    };
  }
}
