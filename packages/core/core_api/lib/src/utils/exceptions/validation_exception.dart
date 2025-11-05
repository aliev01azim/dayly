import 'package:core_api/core_api.dart';

class ValidationException extends AppException {
  const ValidationException({
    required super.message,
    super.stackTrace,
    this.field,
    this.validationErrors,
  });

  final String? field;
  final Map<String, dynamic>? validationErrors;

  @override
  String toString() => 'ValidationException: $message';
}
