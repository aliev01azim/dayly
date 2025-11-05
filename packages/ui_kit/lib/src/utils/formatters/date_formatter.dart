import 'package:flutter/services.dart';

class MonthYearFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (text.length > 4) {
      text = text.substring(0, 4);
    }

    String formatted = '';
    if (text.isNotEmpty) {
      formatted += text.substring(0, text.length > 2 ? 2 : text.length);
      if (text.length > 2) {
        formatted += '/';
        formatted += text.substring(2);
      }
    }

    if (formatted.length >= 2) {
      final month = int.tryParse(formatted.substring(0, 2));
      if (month != null && (month < 1 || month > 12)) {
        return oldValue;
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}