import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/src/utils/validator/email_validator.dart';
import 'package:ui_kit/ui_kit.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool enabled;
  final Function(String text) onChanged;
  final Function(String text)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? capitalization;
  final String? hint;
  final String? errorText;
  final String? bottomHintText;
  final int? maxLength;
  final int validateCount;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final TextStyle? style;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool validate;
  final BoxConstraints? suffixIconConstraints;
  final TextInputAction? textInputAction;
  final bool setActiveBorderColor;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final bool emailValidate;
  final String? textCustomError;
  final bool autovalidateMode;
  final bool? readOnly;
  final FocusNode? focusNode;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final bool autofocus;
  final TextStyle? bottomHintTextStyle;
  final BorderRadius? borderRadius;
  final void Function(PointerDownEvent)? onTapOutside;
  final EdgeInsets scrollPadding;
  final EdgeInsets? contentPadding;

  const DefaultTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.onChanged,
    this.autovalidateMode = true,
    this.onSubmitted,
    this.errorText,
    this.bottomHintText,
    this.capitalization,
    this.maxLength,
    this.readOnly,
    this.maxLengthEnforcement,
    this.inputFormatters,
    this.hint,
    this.enabled = true,
    this.style,
    this.maxLines,
    this.suffixIconConstraints,
    this.suffixIcon,
    this.onEditingComplete,
    this.onTap,
    this.textInputAction,
    this.setActiveBorderColor = false,
    this.validate = false,
    this.emailValidate = false,
    this.validateCount = 3,
    this.textCustomError,
    this.focusNode,
    this.prefixText,
    this.prefixStyle,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.autofocus = false,
    this.borderRadius,
    this.bottomHintTextStyle,
    this.onTapOutside,
    this.contentPadding,
    this.scrollPadding = const EdgeInsets.all(20.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          readOnly: readOnly ?? false,
          scrollPadding: scrollPadding,
          focusNode: focusNode,
          onTap: () => onTap?.call(),
          cursorHeight: 16,
          cursorWidth: 1,
          onFieldSubmitted: onSubmitted,
          autofocus: autofocus,
          enableInteractiveSelection: readOnly != true && enabled,
          validator: (value) {
            if (!validate) return null;
            if (textCustomError != null) return textCustomError;
            if (value == null ||
                value.isEmpty ||
                value.length < validateCount ||
                (emailValidate && !validateEmail(value))) {
              return errorText ?? 'Некорректный формат';
            }
            return null;
          },
          inputFormatters: inputFormatters,
          autovalidateMode: autovalidateMode ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
          textCapitalization: capitalization ?? TextCapitalization.none,
          onChanged: onChanged,
          maxLength: maxLength,
          maxLengthEnforcement: maxLengthEnforcement ?? MaxLengthEnforcement.truncateAfterCompositionEnds,
          cursorColor: MainPalette.textBasePrimary,
          style:
              style ??
              AppTextStyles.inputText(color: enabled ? MainPalette.inputText : MainPalette.inputText.withOpacity(0.6)),
          controller: controller,
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          enableSuggestions: false,
          autocorrect: false,
          onEditingComplete: onEditingComplete,
          onTapOutside: onTapOutside,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            filled: true,
            isDense: true,
            counterText: '',
            hintText: hint,
            prefixText: prefixText,
            prefix: prefixText != null || prefixIcon != null ? null : const SizedBox(width: 16),
            prefixStyle: prefixStyle,
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            hintStyle: AppTextStyles.inputText(color: MainPalette.textBaseTertiary),
            contentPadding: contentPadding ?? const EdgeInsets.symmetric(vertical: 9),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: validate || errorText == null ? MainPalette.borderActionNormal : MainPalette.red,
              ),
              borderRadius: BorderRadius.circular(16),
              gapPadding: 6,
            ),
            suffixIconConstraints: suffixIconConstraints ?? const BoxConstraints(minHeight: 24, minWidth: 24),
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: validate || errorText == null ? MainPalette.main : MainPalette.red),
              borderRadius: borderRadius ?? BorderRadius.circular(16),
              gapPadding: 6,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: validate || errorText == null ? MainPalette.borderActionNormal : MainPalette.red,
              ),
              borderRadius: BorderRadius.circular(16),
              gapPadding: 6,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: MainPalette.red),
              borderRadius: BorderRadius.circular(16),
            ),
            errorStyle: AppTextStyles.p(color: MainPalette.red),
            disabledBorder: enabled == false && errorText?.isNotEmpty == true
                ? OutlineInputBorder(
                    borderSide: const BorderSide(color: MainPalette.borderActionNormal),
                    borderRadius: BorderRadius.circular(16),
                  )
                : null,
          ),
          enabled: enabled,
        ),
        if (!validate && (bottomHintText != null || errorText != null)) ...[
          const SizedBox(height: 2),
          Text(
            errorText != null ? errorText! : bottomHintText!,
            style: errorText != null
                ? AppTextStyles.p(color: MainPalette.red)
                : bottomHintTextStyle ?? AppTextStyles.p(color: MainPalette.auroMetalSaurusColor),
          ),
        ],
      ],
    );
  }
}
