import 'package:core/src/utils/exceptions/app_exception.dart';

/// Исключение для ошибок парсинга данных
class ParseException extends AppException {
  const ParseException({
    super.message = 'Failed to parse data',
    super.stackTrace,
    super.cause,
  });

  @override
  String toString() => 'ParseException: $message';
}
