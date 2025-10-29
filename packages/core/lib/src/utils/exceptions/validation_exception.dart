import 'package:core/src/utils/exceptions/app_exception.dart';

class ValidationException extends AppException {
  const ValidationException({
    required super.message,
    super.stackTrace,
    this.field,
    this.validationErrors,
  });

  final String? field;
  final Map<String, String>? validationErrors;

  @override
  String toString() => 'ValidationException: $message';
}
