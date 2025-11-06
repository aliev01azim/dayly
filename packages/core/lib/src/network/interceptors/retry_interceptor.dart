import 'dart:async';
import 'package:dio/dio.dart';

/// Интерцептор для автоматического повторения неудачных запросов
class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    this.maxRetries = 2,
    this.retryDelays = const [
      Duration(seconds: 1),
      Duration(seconds: 2),
    ],
    this.retryableStatusCodes = const [500, 502, 503, 504],
    this.retryableExceptions = const [
      DioExceptionType.connectionTimeout,
      DioExceptionType.sendTimeout,
      DioExceptionType.receiveTimeout,
    ],
  });

  /// Максимальное количество попыток (не включая первую)
  final int maxRetries;

  /// Задержки между попытками
  final List<Duration> retryDelays;

  /// HTTP коды, при которых нужно повторить запрос
  final List<int> retryableStatusCodes;

  /// Типы DioException, при которых нужно повторить запрос
  final List<DioExceptionType> retryableExceptions;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Проверяем, можно ли повторить запрос
    if (!_shouldRetry(err)) {
      return handler.next(err);
    }

    // Получаем текущее количество попыток
    final currentAttempt = err.requestOptions.extra['retry_attempt'] ?? 0;

    // Если превышено максимальное количество попыток
    if (currentAttempt >= maxRetries) {
      return handler.next(err);
    }

    // Задержка перед повторной попыткой
    final delayIndex = currentAttempt < retryDelays.length ? currentAttempt : retryDelays.length - 1;
    final delay = retryDelays[delayIndex];

    await Future.delayed(delay);

    // Обновляем счётчик попыток
    err.requestOptions.extra['retry_attempt'] = currentAttempt + 1;

    try {
      // Повторяем запрос
      final response = await Dio().fetch(err.requestOptions);
      return handler.resolve(response);
    } on DioException catch (e) {
      // Если повторный запрос тоже упал - передаём ошибку дальше
      return handler.next(e);
    }
  }

  /// Определяет, нужно ли повторить запрос
  bool _shouldRetry(DioException err) {
    // Не повторяем для определённых методов (POST с созданием данных может привести к дубликатам)
    final method = err.requestOptions.method.toUpperCase();
    if (method == 'POST' || method == 'PUT' || method == 'PATCH') {
      // Для POST/PUT/PATCH повторяем только при сетевых ошибках, но не при 500
      // т.к. 500 может означать что запрос был частично обработан
      if (retryableExceptions.contains(err.type)) {
        return true;
      }
      return false;
    }

    // Для GET, DELETE и других безопасных методов
    // 1. Проверяем статус код ответа
    final statusCode = err.response?.statusCode;
    if (statusCode != null && retryableStatusCodes.contains(statusCode)) {
      return true;
    }

    // 2. Проверяем тип ошибки
    if (retryableExceptions.contains(err.type)) {
      return true;
    }

    return false;
  }
}
