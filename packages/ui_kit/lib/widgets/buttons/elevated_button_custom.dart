import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:ui_kit/widgets/loadings/loadings.dart';

class ElevatedButtonCustom extends StatelessWidget {
  const ElevatedButtonCustom({
    super.key,
    this.isLoading = false,
    this.padding,
    this.enabled = true,
    this.borderRadius,
    required this.text,
    required this.onTap,
  });
  final bool isLoading;
  final EdgeInsets? padding;
  final bool enabled;
  final double? borderRadius;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled && !isLoading ? onTap : null,
      style: ElevatedButton.styleFrom(
        padding: padding??const EdgeInsets.all(12),
        backgroundColor: MainPalette.main,
        overlayColor: MainPalette.focus,
        shadowColor: Colors.transparent,
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 16)),
      ),
      child: isLoading ? const LoadingIndicatorCustom() : Text(text, style: AppTextStyles.buttonText()),
    );
  }
}
