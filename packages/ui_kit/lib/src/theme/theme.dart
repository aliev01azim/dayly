import 'package:assets/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        fontFamily: Assets.fonts.interRegular,
        textTheme: const TextTheme(bodyMedium: TextStyle(fontWeight: FontWeight.w400)),
      );

  static ThemeData get dark => ThemeData(
      );
}
