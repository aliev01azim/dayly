import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/ui_kit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.titleTextStyle,
    this.showGoBack = true,
    this.actions,
    this.backgroundColor,
    this.systemUiOverlayStyle,
  });
  final String title;
  final TextStyle? titleTextStyle;
  final bool showGoBack;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final SystemUiOverlayStyle? systemUiOverlayStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          systemUiOverlayStyle ??
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.light),
      backgroundColor: backgroundColor ?? Colors.transparent,
      title: Text(title, style: titleTextStyle ?? AppTextStyles.h1(color: MainPalette.black)),
      centerTitle: false,
      leading: showGoBack ? const Icon(Icons.arrow_back) : const SizedBox.shrink(),
      elevation: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
