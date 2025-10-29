import 'package:core/core.dart';
import 'package:core/src/di/di_helper/base_di_module.dart';
import 'package:data/data.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DataDiModule extends BaseDiModule {
  @override
  void initModule(GetIt getIt) {
    getIt
      ..registerLazySingleton<RemoteUsersDataSource>(() => RemoteUsersDataSourceImpl(client: getIt<HttpClient>()))
      ..registerLazySingleton<UsersRepository>(
        () => UsersRepositoryImpl(remoteUsersDataSource: getIt<RemoteUsersDataSource>()),
      );
  }
}
