import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.loading() = _Loading;
  const factory SplashState.authorized() = _Authorized;
  const factory SplashState.unauthorized() = _Unauthorized;
  const factory SplashState.needUpdate() = _NeedUpdate;
  const factory SplashState.error([String? message]) = _Error;
}
