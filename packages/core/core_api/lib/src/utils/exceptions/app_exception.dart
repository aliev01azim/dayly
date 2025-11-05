abstract class AppException implements Exception {
  const AppException({
    required this.message,
    this.stackTrace,
    this.cause,
  });

  final String message;
  final StackTrace? stackTrace;
  final Object? cause;

  @override
  String toString() => 'AppException: $message';
}
