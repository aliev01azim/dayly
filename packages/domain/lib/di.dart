import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DomainDiModule extends BaseDiModule {
  @override
  void initModule(GetIt getIt) {
    getIt.registerLazySingleton<GetUsersUseCase>(
      () => GetUsersUseCaseImpl(usersRepository: getIt<UsersRepository>()),
    );
  }

}
