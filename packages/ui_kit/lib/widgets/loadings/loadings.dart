import 'package:flutter/material.dart';
import 'package:ui_kit/src/theme/main_palette.dart';

class LoadingIndicatorCustom extends StatelessWidget {
  const LoadingIndicatorCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 12,
      height: 12,
      child: Center(child: CircularProgressIndicator(color: MainPalette.iconBaseTertiary,strokeWidth: 1,)),
    );
  }
}
