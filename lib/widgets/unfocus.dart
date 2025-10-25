import 'package:flutter/widgets.dart';
import 'package:test_dayly/heplers/helper.dart';

class UnFocus extends StatelessWidget {
  final Widget child;
  final bool primary; //иногда нужно снимать primary фокус

  const UnFocus({
    super.key,
    required this.child,
    this.primary = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (primary) {
          unFocusPrimary(context);
        } else {
          unFocus(context);
        }
      },
      child: child,
    );
  }
}
