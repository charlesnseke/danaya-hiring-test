import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testtech/src/common/ka/themes/app_theme_colors.dart';

import '../themes/app_theme.dart';
import '../utils/dimension.dart';

mixin  KaScreenMixin {
  ThemeData get theme => KaTheme.theme;

  KaThemeColors get themeColors => KaTheme.themeColors;
  
  void displayToast({
    required String msg,
    Color? bgColor,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: bgColor ?? theme.colorScheme.primary,
      textColor: textColor ?? Colors.white,
      fontSize: KaDeviceDimension.ratio16,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT
    );
  }
}