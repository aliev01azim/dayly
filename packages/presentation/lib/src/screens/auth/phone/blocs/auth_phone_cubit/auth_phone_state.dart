import 'package:domain_api/domain_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_phone_state.freezed.dart';

@freezed
class AuthPhoneState with _$AuthPhoneState {
  const factory AuthPhoneState.initial() = _Initial;
  const factory AuthPhoneState.challenging() = _Challenging;
  const factory AuthPhoneState.challenged({required String? error, required Challenge? challenge}) = _Challenged;
  const factory AuthPhoneState.verifying() = _Verifying;
  const factory AuthPhoneState.verified({required String? error, required AuthToken? authToken}) = _Verified;
  const factory AuthPhoneState.resending() = _Resending;
  const factory AuthPhoneState.resent({required String? error, required Challenge? challenge}) = _Resent;
}
