import 'dart:developer';

import 'package:core/core.dart';
import 'package:core_api/core_api.dart';
import 'package:dio/dio.dart' show LogInterceptor;
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class CoreDiModule extends BaseDiModule {
  @override
  void initModule(GetIt getIt) {
    _registerInterceptors(getIt);
    _registerHttpClient(getIt);
    /* Напрмер
    _registerLocalizations(getIt);
    _registerEnvironmentConfig(getIt);
    _registerAnalytics(getIt);
    _registerDeviceInfo(getIt);
    */
  }

  void _registerInterceptors(GetIt getIt) {
    getIt.registerLazySingleton<TokenInterceptor>(() => TokenInterceptor(getAuthTokenUseCase: getIt()));
    // ..registerLazySingleton<ConnectionInterceptor>(() => ConnectionInterceptor())
    // ..registerLazySingleton<DeviceInfoInterceptor>(() => DeviceInfoInterceptor())
    // ..registerLazySingleton<LogOutInterceptor>(() => LogOutInterceptor())
    // ..registerLazySingleton<ErrorHandlerInterceptor>(() => ErrorHandlerInterceptor());
  }

  void _registerHttpClient(GetIt getIt) {
    getIt.registerLazySingleton<HttpClient>(() {
      final client = HttpClient(
        baseUrl: 'example',
        interceptors: [
          getIt<TokenInterceptor>(),
          if (!kReleaseMode) LogInterceptor(requestBody: true, responseBody: true, logPrint: (m) => log(m.toString())),

          /*getIt<ConnectionInterceptor>(),
          getIt<DeviceInfoInterceptor>(),
          getIt<LogOutInterceptor>(),
          getIt<ErrorHandlerInterceptor>(),*/
        ],
      );

      // Добавляем retry и refresh interceptors
      client.interceptors.addAll([
        RetryInterceptor(),
        RefreshTokenInterceptor(
          client: client,
          authEventManager: getIt(),
          getAuthTokenUseCase: getIt(),
        ),
      ]);

      return client;
    });
  }
}
