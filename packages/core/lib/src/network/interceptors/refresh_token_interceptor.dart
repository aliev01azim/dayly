import 'dart:async';
import 'package:core/core.dart';
import 'package:core_api/core_api.dart';
import 'package:dio/dio.dart';
import 'package:domain_api/domain_api.dart';

class RefreshTokenInterceptor extends Interceptor {
  RefreshTokenInterceptor({
    required Dio client,
    required AuthEventManager authEventManager,
    required GetAuthTokenUseCase getAuthTokenUseCase,
    RefreshTokenUseCase? refreshTokenUseCase,
  }) : _client = client,
       _authEventManager = authEventManager,
       _getAuthTokenUseCase = getAuthTokenUseCase,
       _refreshTokenUseCase = refreshTokenUseCase;

  final Dio _client;
  final AuthEventManager _authEventManager;
  final GetAuthTokenUseCase _getAuthTokenUseCase;
  final RefreshTokenUseCase? _refreshTokenUseCase;
  RefreshTokenUseCase get refreshTokenUseCase => _refreshTokenUseCase ?? getIt();

  static Completer<bool>? _refreshCompleter;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final requestUri = err.requestOptions.uri.toString();

    final isAuthEndpoint = authPaths.contains(requestUri);
    final alreadyRetried = err.requestOptions.extra['retriedAfterRefresh'] == true;

    if (statusCode != 401 || isAuthEndpoint) {
      return handler.next(err);
    }

    if (alreadyRetried) {
      _authEventManager.notifySignInRequired();
      return handler.next(err);
    }

    try {
      final refreshed = await _refreshTokenIfNeeded();

      if (!refreshed) {
        _authEventManager.notifySignInRequired();
        return handler.next(err);
      }

      final tokensResult = await _getAuthTokenUseCase.invoke(const EmptyUseCaseParams());

      if (!tokensResult.isSuccess || tokensResult.succesResult?.accessToken == null) {
        _authEventManager.notifySignInRequired();
        return handler.next(err);
      }

      final newToken = tokensResult.succesResult!;
      err.requestOptions.headers['Authorization'] = 'Bearer ${newToken.accessToken}';
      err.requestOptions.extra = {...err.requestOptions.extra, 'retriedAfterRefresh': true};

      final response = await _client.fetch(err.requestOptions);
      return handler.resolve(response);
    } catch (_) {
      _authEventManager.notifySignInRequired();
      return handler.next(err);
    }
  }

  Future<bool> _refreshTokenIfNeeded() async {
    if (_refreshCompleter != null) {
      return _refreshCompleter!.future;
    }

    final completer = Completer<bool>();
    _refreshCompleter = completer;

    try {
      final tokensResult = await _getAuthTokenUseCase.invoke(const EmptyUseCaseParams());

      if (tokensResult.isSuccess && tokensResult.succesResult?.refreshToken != null) {
        final result = await refreshTokenUseCase.invoke(tokensResult.succesResult!.refreshToken!);
        final refreshed = result.isSuccess && result.succesResult?.accessToken!=null;
        completer.complete(refreshed);
        return refreshed;
      }
      return false;
    } catch (_) {
      completer.complete(false);
      return false;
    } finally {
      _refreshCompleter = null;
    }
  }
}

const List<String> authPaths = ['/phone-auth', '/phone_auth'];
const List<String> noRefreshPaths = ['/alfa/token/update', '/users/update-tinkoff'];
