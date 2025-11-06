import 'package:core_api/core_api.dart';
import 'package:data/data.dart';
import 'package:data/features/auth/auth.dart';
import 'package:data/features/auth/data_sources/remote/remote_auth_by_phone_data_source_impl.dart';
import 'package:data_api/data_api.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DataDiModule extends BaseDiModule {
  @override
  void initModule(GetIt getIt) {
    getIt
      ..registerLazySingleton<RemoteUsersDataSource>(() => RemoteUsersDataSourceImpl(client: getIt<HttpClient>()))
      ..registerLazySingleton<UsersRepository>(
        () => UsersRepositoryImpl(remoteUsersDataSource: getIt<RemoteUsersDataSource>()),
      )
      ..registerLazySingleton<TokensStorage>(TokensStorageImpl.new)
      ..registerLazySingleton<StorageRepository>(() => StorageRepositoryImpl(tokensStorage: getIt()))
      ..registerLazySingleton<RemoteAuthByPhoneDataSource>(
        () => RemoteAuthByPhoneDataSourceImpl(client: getIt<HttpClient>()),
      )
      ..registerLazySingleton<AuthByPhoneRepository>(
        () => AuthByPhoneRepositoryImpl(remoteAuthByPhoneDataSource: getIt()),
      );
  }
}
