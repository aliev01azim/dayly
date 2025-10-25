import 'package:flutter/material.dart';
import 'package:test_dayly/heplers/colors.dart';
import 'package:test_dayly/widgets/unfocus.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    this.title,
    this.mainAxisSize = MainAxisSize.max,
    this.hasBottomPadding = true,
    this.background,
    this.hasHandlePadding = true,
    this.titleSpace,
    required this.child,
  });

  final Widget child;
  final String? title;
  final MainAxisSize mainAxisSize;
  final bool hasBottomPadding;
  final Color? background;
  final bool hasHandlePadding;
  final double? titleSpace;
  @override
  Widget build(BuildContext context) {
    return UnFocus(
      child: Container(
        decoration: BoxDecoration(
          color: background ?? Colors.white,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
        child: Column(
          mainAxisSize: mainAxisSize,
          children: [
            const SizedBox(height: 5),
            const _BottomSheetDragHandle(),
            if (hasHandlePadding) const SizedBox(height: 10),
            if (title != null) ...[_BottomSheetTitle(title!), SizedBox(height: titleSpace ?? 24)],
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _BottomSheetTitle extends StatelessWidget {
  const _BottomSheetTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),
    );
  }
}

class _BottomSheetDragHandle extends StatelessWidget {
  const _BottomSheetDragHandle();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 36,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: auroMetalSaurusColor.withOpacity(0.3), borderRadius: BorderRadius.circular(5)),
    );
  }
}
