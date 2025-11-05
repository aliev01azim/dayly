// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class Formatters {
  static TextInputFormatter get email {
    return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9._%+-@]'));
  }

  static TextInputFormatter get denyWhitespace {
    return FilteringTextInputFormatter.deny(RegExp(r'\s'));
  }

  static TextInputFormatter get fourDigitOtpCode {
    return MaskTextInputFormatter(mask: '####', filter: {'#': RegExp(r'[0-9]')}, type: MaskAutoCompletionType.eager);
  }

  static String getUnmaskedPhoneNumber(String maskedPhoneNumber) {
    return maskedPhoneNumber.replaceAll(RegExp(r'\D'), '');
  }
}
