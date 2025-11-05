import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/ui_kit.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hint,
    this.bottomHintText,
    this.errorText,
    this.inputFormatters,
    this.focusNode,
  });
  final TextEditingController controller;
  final Function(String text) onChanged;
  final String? hint;
  final String? bottomHintText;
  final String? errorText;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      bottomHintText: bottomHintText,
      errorText: errorText,
      inputFormatters: [...?inputFormatters],
      maxLength: 16,
      hint: hint,
    );
  }
}
