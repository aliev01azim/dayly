// ignore_for_file: avoid_classes_with_only_static_members

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
  static TextStyle title({
    Color? color,
    double? height,
    FontWeight? fontWeight,
    double? fontSize,
    double? letterSpacing,
  }) => TextStyle(
    color: color,
    fontSize: fontSize ?? 24,
    fontFamily: FontFamily.inter,
    fontWeight: fontWeight ?? FontWeight.w600,
    height: height ?? 1.33,
    letterSpacing: letterSpacing ?? -0.30,
  );
  static TextStyle inputText({Color? color, double? height, FontWeight? fontWeight, double? fontSize}) => TextStyle(
    color: color ?? MainPalette.inputText,
    fontSize: fontSize ?? 16,
    fontFamily: FontFamily.inter,
    fontWeight: fontWeight ?? FontWeight.w400,
    height: height ?? 1.50,
  );
  static TextStyle buttonText({Color? color, double? height, FontWeight? fontWeight, double? fontSize}) => TextStyle(
    color: color??MainPalette.textBasePrimary,
    fontSize: fontSize ?? 16,
    fontFamily: FontFamily.inter,
    fontWeight: fontWeight ?? FontWeight.w500,
    height: height ?? 1.50,
  );
  static TextStyle codeText({Color? color, double? height, FontWeight? fontWeight, double? fontSize}) => TextStyle(
    color: color ?? MainPalette.textBasePrimary,
    fontSize: fontSize ?? 48,
    fontFamily: FontFamily.inter,
    fontWeight: fontWeight ?? FontWeight.w400,
    height: height ?? 1.17,
  );
}
