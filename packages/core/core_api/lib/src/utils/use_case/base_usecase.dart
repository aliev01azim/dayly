import 'dart:async';
import 'package:core_api/core_api.dart';
import 'package:flutter/foundation.dart';

abstract class BaseUseCase<T, P, F> {
  const BaseUseCase();

  Future<Result<F, T>> invoke(P params) async {
    try {
      final result = await makeRequest(params);
      return result is Result
          ? result.fold(
              onFailure: (e) => Result.failure(e),
              onSuccess: (s) => Result.success(s),
            )
          : Result.success(result);
    } catch (e, stackTrace) {
      final error = convertError(e, stackTrace);

      return Result.failure(error);
    }
  }

  @protected
  F convertError(Object error, StackTrace stackTrace);

  @protected
  FutureOr<T> makeRequest(P params);
}

abstract class BaseSyncUseCase<T, P, F> {
  const BaseSyncUseCase();

  Result<F, T> invoke(P params) {
    try {
      final result = makeRequest(params);
      return result is Result
          ? result.fold(
              onFailure: (e) => Result.failure(e),
              onSuccess: (s) => Result.success(s),
            )
          : Result.success(result);
    } catch (e, stackTrace) {
      final error = convertError(e, stackTrace);

      return Result.failure(error);
    }
  }

  @protected
  F convertError(Object error, StackTrace stackTrace);

  @protected
  T makeRequest(P params);
}

abstract class BaseStreamUseCase<T, F, P> {
  const BaseStreamUseCase();

  Stream<Result<F, T>> invoke(P params) {
    final source = getSourceStream(params);

    return source.transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(Result.success(data));
        },
        handleError: (error, trace, sink) {
          sink.add(Result.failure(convertError(error, trace)));
        },
      ),
    );
  }

  @protected
  F convertError(Object error, StackTrace stackTrace);

  @protected
  Stream<T> getSourceStream(P params);
}
