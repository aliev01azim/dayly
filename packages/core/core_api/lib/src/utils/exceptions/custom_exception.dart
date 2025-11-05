import 'package:core_api/core_api.dart';

/// Исключение для пользовательских ошибок с произвольным сообщением
class CustomException extends AppException {
  const CustomException({
    required super.message,
    super.stackTrace,
    super.cause,
  });

  @override
  String toString() => 'CustomException: $message';
}
