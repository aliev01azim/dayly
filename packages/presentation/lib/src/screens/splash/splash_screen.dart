import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/src/router/routes.dart';
import 'package:presentation/src/screens/splash/splash_cubit/splash_cubit.dart';
import 'package:presentation/src/screens/splash/splash_cubit/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const path = 'splash';

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        state.mapOrNull(
          authorized: (_) => context.go(AppRoutes.home),
          unauthorized: (_) => print('Навигация на экран авторизации'),
          needUpdate: (_) => print('Навигация на экран обновления приложения'),
          error: (_) => print('Можно показать диалог с ошибкой или что-то еще'),
        );
      },
      child: const _SplashView(),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
