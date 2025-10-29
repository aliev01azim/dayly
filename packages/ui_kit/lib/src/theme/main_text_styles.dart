import 'package:assets/fonts.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle h1({Color? color}) => TextStyle(
    color: color ?? MainPalette.black,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.inter,
  );

  static TextStyle p({Color? color, double? height, FontWeight? fontWeight, double? fontSize}) => TextStyle(
    color: color ?? MainPalette.black,
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: height,
    fontFamily: FontFamily.inter,
  );
}
