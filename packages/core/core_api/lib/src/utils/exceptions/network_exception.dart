
import 'package:core_api/core_api.dart';

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
