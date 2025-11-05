// ignore_for_file: avoid_classes_with_only_static_members

import 'package:assets/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/src/theme/main_palette.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    fontFamily: Assets.fonts.interRegular,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontWeight: FontWeight.w400, color: MainPalette.textBasePrimary),
    ),
  );

  static ThemeData get dark => ThemeData();
}
