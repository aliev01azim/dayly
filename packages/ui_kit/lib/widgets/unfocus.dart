import 'package:flutter/widgets.dart';

class UnFocus extends StatelessWidget { //иногда нужно снимать primary фокус

  const UnFocus({super.key, required this.child, this.primary = false});
  final Widget child;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (primary) {
          final currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        } else {
          final currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            currentFocus.unfocus();
          }
        }
      },
      child: child,
    );
  }
}
