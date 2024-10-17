import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../styles/text_style.dart';
import '../themes/app_theme_colors.dart';

class Buttons extends StatelessWidget {
  final String btnText;
  final Color? buttonColor;
  final Color? textColor;
  final double? minWidth;
  final double? minHeight;
  final FontWeight? fontWeight;
  final Function() onTap;
  final double? textSize;
  final double? fieldRadius;
  final Color? borderColor;
  final IconData? icon;

  const Buttons(
      {super.key,
        required this.btnText,
        this.buttonColor,
        this.textColor,
        this.minWidth,
        required this.onTap,
        this.textSize,
        this.fontWeight,
        this.fieldRadius,
        this.borderColor,
        this.minHeight,
        this.icon});

  @override
  Widget build(BuildContext context) {
    final  width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width:  minWidth,
      height: minHeight,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: buttonColor ?? KaThemeColors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(fieldRadius ?? 10),
            )),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: kIsWeb ? height / 45 : height / 50),
            child: Text(
              btnText,
              style: KaTextStyle.labelLarge(
                  fontSize: 18,
                  color: KaThemeColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
