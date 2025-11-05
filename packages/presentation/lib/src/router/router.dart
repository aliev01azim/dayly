import 'package:core_api/core_api.dart';
import 'package:domain_api/domain_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/di.dart';
import 'package:presentation/src/router/routes.dart';
import 'package:presentation/src/screens/auth/phone/auth_phone_otp_screen.dart';
import 'package:presentation/src/screens/auth/phone/auth_phone_screen.dart';
import 'package:presentation/src/screens/auth/phone/blocs/auth_phone_cubit/auth_phone_cubit.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_cubit.dart';
import 'package:presentation/src/screens/home/blocs/users/users_cubit.dart';
import 'package:presentation/src/screens/home/home_screen.dart';
import 'package:presentation/src/screens/splash/splash_cubit/splash_cubit.dart';
import 'package:presentation/src/screens/splash/splash_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: AppRoutes.splash,

  routes: [
    ///splash
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => BlocProvider<SplashCubit>(create: (context) => getIt(), child: const SplashScreen()),
    ),

    ///home
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: AppRoutes.home,
      name: AppRoutes.home,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<CalendarCubit>(create: (context) => getIt()),
          BlocProvider<UsersCubit>(create: (context) => getIt()),
        ],
        child: const Home(),
      ),
    ),
    //login
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: AppRoutes.authPhone,
      name: AppRoutes.authPhone,
      builder: (context, state) =>
          BlocProvider<AuthPhoneCubit>(create: (context) => getIt(), child: const AuthPhoneScreen()),
      // redirect: (context, state) async {
      //   try {
      //     final tokensResult = await getIt<GetAuthTokenUseCase>().invoke(const EmptyUseCaseParams());
      //     tokensResult.onSuccess((r) {
      //       if (r != null && r.accessToken != null) {
      //         return AppRoutes.home;
      //       }
      //     });
      //   } catch (e, s) {}
      //   return state.path;
      // },
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: AppRoutes.authPhoneOtp,
      name: AppRoutes.authPhoneOtp,
      //Временно
      builder: (context, state) =>
          BlocProvider<AuthPhoneCubit>(create: (context) => getIt(), child:  AuthPhoneOtpScreen(challenge: state.extra as Challenge,)),
    ),
  ],
);
