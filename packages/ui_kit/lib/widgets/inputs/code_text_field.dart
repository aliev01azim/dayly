import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ui_kit/ui_kit.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    super.key,
    this.onCodeChanged,
    this.onCodeCompleted,
    this.enabled = true,
    this.hasError = false,
    this.focusNode,
    this.controller,
    this.length = 4,
  });

  final Function(String text)? onCodeChanged;
  final Function(String text)? onCodeCompleted;

  final bool enabled;
  final bool hasError;

  final FocusNode? focusNode;
  final TextEditingController? controller;

  final int length;

  @override
  Widget build(BuildContext context) {
        final screenWidth = MediaQuery.of(context).size.width;
    const horizontalPadding = 32.0; // отступы от краёв экрана
    const spacing = 8.0; // промежуток между ячейками

    // вычисляем ширину одной ячейки, чтобы всё ровно влезло
    final availableWidth = screenWidth - horizontalPadding * 2 - (spacing * (length - 1));
    final fieldWidth = availableWidth / length;

    return PinCodeTextField(
      autoDisposeControllers: false,
      appContext: context,
      controller: controller,
      focusNode: focusNode,
      autoFocus: true,
      length: length,
      keyboardType: TextInputType.number,
      errorTextSpace: 0,
      enableActiveFill: true,
      pinTheme: PinTheme(
        activeColor: MainPalette.borderActionNormal,
        selectedColor: MainPalette.borderBaseInverted,
        inactiveColor: MainPalette.borderActionNormal,
        disabledColor: Colors.transparent,
        activeFillColor: Colors.transparent,
        selectedFillColor: Colors.transparent,
        inactiveFillColor: Colors.transparent,
        borderWidth: 1,
        fieldHeight: 75,
        fieldWidth: fieldWidth,
        activeBorderWidth: 1,
        disabledBorderWidth: 1,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(16),
        errorBorderColor: Colors.transparent,
      ),
      animationType: AnimationType.scale,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'\d'))],
      onChanged: onCodeChanged,
      onCompleted: onCodeCompleted,
      cursorColor: MainPalette.black,
      cursorWidth: 1,
      textStyle: AppTextStyles.codeText(color: hasError ? MainPalette.red : null),
      separatorBuilder: (context, state) => const SizedBox(width: spacing),
    );
  }
}
