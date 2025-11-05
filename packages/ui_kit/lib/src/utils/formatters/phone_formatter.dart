import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneFormatter {
  /// Old phone input
  static MaskTextInputFormatter getPhoneInput({String? initialText}) {
    return MaskTextInputFormatter(
      initialText: initialText,
      mask: '### ### ## ##',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager,
    );
  }

  /// Nine-digit phone input
  static MaskTextInputFormatter getNineDigitPhoneInput({String? initialText}) {
    return MaskTextInputFormatter(
      initialText: initialText,
      mask: '##-###-####',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager,
    );
  }

  /// Ten-digit phone input
  static MaskTextInputFormatter getTenDigitPhoneInput({String? initialText}) {
    return MaskTextInputFormatter(
      initialText: initialText,
      mask: '###-###-##-##',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager,
    );
  }

  /// Return phone number "[prefix]xxxxxxxxxx" from mask "xxx-xxx-xx-xx"
  static String getUnMaskedPhoneWithCustomPrefix({required String maskedPhone, required String prefix}) {
    if (maskedPhone.startsWith('+')) {
      return '${maskedPhone.replaceAll(RegExp(r'\D'), '')}';
    }

    return '$prefix${maskedPhone.replaceAll(RegExp(r'\D'), '')}';
  }

  /// Phone number "+7xxxxxxxxxx" from mask "(xxx) xxx-xx-xx"
  static String getUnMaskedPhone(String phone) {
    return '+7${phone.replaceAll(RegExp(r'\D'), '')}';
  }

  /// Phone number validator from mask "(xxx) xxx-xx-xx"
  static bool isMaskedPhoneValid(String phone) {
    return phone.length == 13;
  }

  static String preparePhoneForMask(String phone) {
    return phone.startsWith('+7') ? phone.replaceFirst('+7', '') : phone;
  }

  static String maskPhone(String phone) {
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 4) return '*${digits.padLeft(4, '0').substring(digits.length - 2)}';
    final last4 = digits.substring(digits.length - 4);
    return '*${last4.substring(0, 2)}-${last4.substring(2)}';
  }
}
