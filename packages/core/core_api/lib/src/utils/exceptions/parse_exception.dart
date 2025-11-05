import 'package:core_api/core_api.dart';

/// Исключение для ошибок парсинга данных
class ParseException extends AppException {
  const ParseException({super.message = 'Failed to parse data', super.stackTrace, super.cause});

  @override
  String toString() => 'ParseException: $message';
}
