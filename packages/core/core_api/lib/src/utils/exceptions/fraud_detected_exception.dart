
import 'package:core_api/core_api.dart';

class FraudDetectedException extends AppException {
  FraudDetectedException({
    required super.message,
    super.stackTrace,
    super.cause,
  });

  @override
  String toString() => 'FraudDetectedException: $message';
}
