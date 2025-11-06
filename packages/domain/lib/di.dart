import 'package:core_api/core_api.dart';
import 'package:domain/domain.dart';
import 'package:domain/features/auth/use_cases/remote/refresh_token_use_case_impl.dart';
import 'package:domain_api/domain_api.dart';
import 'package:get_it/get_it.dart';

class DomainDiModule extends BaseDiModule {
  @override
  void initModule(GetIt getIt) {
    getIt
      ..registerLazySingleton<GetUsersUseCase>(() => GetUsersUseCaseImpl(usersRepository: getIt()))
      ..registerLazySingleton<GetAuthTokenUseCase>(() => GetAuthTokenUseCaseImpl(storageRepository: getIt()))
      ..registerLazySingleton<SaveAuthTokenUseCase>(() => SaveAuthTokenUseCaseImpl(storageRepository: getIt()))
      ..registerLazySingleton<ChallengeUseCase>(() => ChallengeUseCaseImpl(authByPhoneRepository: getIt()))
      ..registerLazySingleton<VerifyUseCase>(() => VerifyUseCaseImpl(authByPhoneRepository: getIt()))
      ..registerLazySingleton<RefreshTokenUseCase>(()=>RefreshTokenUseCaseImpl(authByPhoneRepository: getIt()))
      ..registerLazySingleton<AuthEventManager>(AuthEventManager.new);
  }
}
