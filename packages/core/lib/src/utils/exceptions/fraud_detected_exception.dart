
import 'package:core/src/utils/exceptions/app_exception.dart';

class FraudDetectedException extends AppException {
  FraudDetectedException({
    required super.message,
    super.stackTrace,
    super.cause,
  });

  @override
  String toString() => 'FraudDetectedException: $message';
}
