// ignore_for_file: dead_code

import 'dart:developer';

import 'package:core_api/core_api.dart';
import 'package:domain_api/domain_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/screens/splash/splash_cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.getAuthTokenUseCase}) : super(const SplashState.initial()) {
    onCreate();
  }
  final GetAuthTokenUseCase getAuthTokenUseCase;

  void onCreate() async {
    ///зависимостей будет больше
    emit(const SplashState.loading());

    late bool hasValidToken;
    final tokensResult = await getAuthTokenUseCase.invoke(const EmptyUseCaseParams());
    tokensResult.fold(
      onFailure: (f) {
        log(f.message.toString());
        return hasValidToken = false;
      },
      onSuccess: (s) {
        log(s?.toData().toString()??'');
        return hasValidToken = s?.accessToken != null;
      },
    );

    final isVersionOk = true;

    ///*await checkAppVersionUseCase()*/ true - ok, false - нужно обновить
    if (!isVersionOk) {
      emit(const SplashState.needUpdate());
    } else if (hasValidToken) {
      emit(const SplashState.authorized());
    } else {
      emit(const SplashState.unauthorized());
    }
  }
}
