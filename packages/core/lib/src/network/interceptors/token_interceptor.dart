import 'package:core_api/core_api.dart';
import 'package:dio/dio.dart';
import 'package:domain_api/domain_api.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor({required GetAuthTokenUseCase getAuthTokenUseCase}) : _getAuthTokenUseCase = getAuthTokenUseCase;

  final GetAuthTokenUseCase _getAuthTokenUseCase;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Accept-Language'] = 'ru';

    // if (noTokenPaths.any((element) => options.path.endsWith(element))) {
    //   return handler.next(options);
    // }
    final tokensResult = await _getAuthTokenUseCase.invoke(const EmptyUseCaseParams());
    tokensResult.onSuccess((r) {
      if (r != null && r.accessToken != null) {
        options.data ??= {};
        options.headers['Authorization'] = '${r.tokenType ?? 'Bearer'} ${r.accessToken}';
        return handler.next(options);
      }
    });

    return handler.next(options);
  }
}

// const List<String> noTokenPaths = ['v1/auth/login'];
