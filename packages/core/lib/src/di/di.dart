import 'package:core/src/di/di_helper/base_di_module.dart';
import 'package:core/src/network/client/http_client.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';

final getIt = GetIt.instance;

class CoreDiModule extends BaseDiModule {
  @override
  void initModule(GetIt getIt) {
    _registerInterceptors(getIt);
    _registerHttpClient(getIt);
    _registerAsyncServices();
    /* Напрмер
    _registerLocalizations(getIt);
    _registerEnvironmentConfig(getIt);
    _registerAnalytics(getIt);
    _registerDeviceInfo(getIt);
    */
  }

  void _registerInterceptors(GetIt getIt) {
    ///регистрируем интерсепторы через registerLazySingleton
    /*getIt
      ..registerLazySingleton<ConnectionInterceptor>(() => ConnectionInterceptor())
      ..registerLazySingleton<TokenInterceptor>(() => TokenInterceptor())
      ..registerLazySingleton<DeviceInfoInterceptor>(() => DeviceInfoInterceptor())
      ..registerLazySingleton<LogOutInterceptor>(() => LogOutInterceptor())
      ..registerLazySingleton<ErrorHandlerInterceptor>(() => ErrorHandlerInterceptor());*/
  }

  void _registerHttpClient(GetIt getIt) {
    getIt.registerLazySingleton<HttpClient>(() {
      final client = HttpClient(
        baseUrl: 'https://example.com/api/',
        interceptors: [
          /*getIt<ConnectionInterceptor>(),
          getIt<TokenInterceptor>(),
          getIt<DeviceInfoInterceptor>(),
          getIt<LogOutInterceptor>(),
          getIt<ErrorHandlerInterceptor>(),*/
        ],
      );

      // Добавляем retry и refresh interceptors
      client.interceptors.addAll([
        /*RetryInterceptor(
          retryableExceptions: [
            DioExceptionType.connectionTimeout,
            DioExceptionType.sendTimeout,
            DioExceptionType.receiveTimeout,
          ],
        ),
        RefreshTokenInterceptor(client: client),*/
      ]);

      return client;
    });
  }

  Future _registerAsyncServices() async {
    //root independent: firebase app, Hive
    await Future.wait([
      // Hive.initFlutter(),
      // Firebase.initializeApp(),
    ]);

    // Adapters
    /*Hive
    ..registerAdapter(UserAdapter())
    ..registerAdapter(UserSessionAdapter());*/

    //hive dependent: boxes initialization
    /*await Future.wait([
    Hive.openBox<User>(HiveBoxes.userBox),
    Hive.openBox<UserSession>(HiveBoxes.userSessionBox),
  ]);*/

    await initializeDateFormatting('ru_RU');
  }
}
