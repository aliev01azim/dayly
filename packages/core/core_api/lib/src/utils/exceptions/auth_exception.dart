
import 'package:core_api/core_api.dart';

/// Типы ошибок авторизации
enum AuthErrorType {
  unauthorized,
  tokenExpired,
  refreshTokenInvalid,
  invalidCredentials,
}

/// Исключение для ошибок авторизации
class AuthException extends AppException {
  const AuthException({
    required super.message,
    super.stackTrace,
    super.cause,
    this.authErrorType,
  });

  final AuthErrorType? authErrorType;

  @override
  String toString() => 'AuthException: $message';
}
