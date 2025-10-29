// ignore_for_file: dead_code

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/screens/splash/splash_cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial()){
    onCreate();
  }
  
  void onCreate() async{
    await Future.delayed(const Duration(seconds: 1)); ///зависимостей будет больше
    emit(const SplashState.loading());

    final hasValidToken = true;

    ///*await checkTokenUseCase()*/  проверка токена
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
