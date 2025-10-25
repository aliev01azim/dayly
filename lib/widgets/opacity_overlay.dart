import 'package:flutter/material.dart';
import 'package:test_dayly/heplers/colors.dart';

class OpacityOverlay extends StatefulWidget {
  const OpacityOverlay({super.key});

  @override
  State<OpacityOverlay> createState() => _OpacityOverlayState();
}

class _OpacityOverlayState extends State<OpacityOverlay> {
  double opacity = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _switchOpacity());
  }

  void _switchOpacity() {
    opacity = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeIn,
        color: lotionColor.withOpacity(opacity),
      ),
    );
  }
}
