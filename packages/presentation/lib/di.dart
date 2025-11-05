import 'package:core_api/core_api.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/src/screens/auth/phone/blocs/auth_phone_cubit/auth_phone_cubit.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_cubit.dart';
import 'package:presentation/src/screens/home/blocs/users/users_cubit.dart';
import 'package:presentation/src/screens/splash/splash_cubit/splash_cubit.dart';

final getIt = GetIt.instance;

class PresentationDiModule extends BaseDiModule {
  @override
  void initModule(GetIt getIt) {
    getIt
      ..registerFactory<SplashCubit>(() => SplashCubit(getAuthTokenUseCase: getIt()))
      ..registerFactory<UsersCubit>(() => UsersCubit(getUsersUseCase: getIt()))
      ..registerFactory<AuthPhoneCubit>(() => AuthPhoneCubit(challengeUseCase: getIt(), verifyUseCase: getIt(), saveAuthTokenUseCase: getIt()))
      ..registerFactory<CalendarCubit>(CalendarCubit.new);
  }
}
