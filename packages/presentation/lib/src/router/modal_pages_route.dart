import 'package:flutter/material.dart';

class ModalPage<T> extends Page<T> {
  final Widget child;

  const ModalPage({
    required this.child,
    super.key,
  });

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        isScrollControlled: true,
        settings: this,
        useSafeArea: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        )),
        builder: (context) => Material(
          color: Colors.transparent,
          child: child,
        ),
      );
}
