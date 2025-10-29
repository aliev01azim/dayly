
import 'package:core/src/utils/exceptions/app_exception.dart';

class NetworkException extends AppException {
  const NetworkException({
    required super.message,
    super.stackTrace,
    super.cause,
    required this.statusCode,
    this.errorModel,
  });

  final int statusCode;
  final Object? errorModel;

  @override
  String toString() {
    return 'NetworkException: ${message.isNotEmpty ? message : errorModel?.toString()}';
  }
}
