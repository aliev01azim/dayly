import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future showModalBottom({required BuildContext context, required WidgetBuilder builder}) {
  return showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: builder,
  );
}
