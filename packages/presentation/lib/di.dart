import 'package:core/src/di/di_helper/base_di_module.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_cubit.dart';
import 'package:presentation/src/screens/home/blocs/users/users_cubit.dart';
import 'package:presentation/src/screens/splash/splash_cubit/splash_cubit.dart';

final getIt = GetIt.instance;

class PresentationDiModule extends BaseDiModule {
  @override
  void initModule(GetIt getIt) {
    getIt
      ..registerFactory<SplashCubit>(SplashCubit.new)
      ..registerFactory<UsersCubit>(() => UsersCubit(getUsersUseCase: getIt<GetUsersUseCase>()))
      ..registerFactory<CalendarCubit>(CalendarCubit.new);
  }
}
