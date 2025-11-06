import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:domain_api/domain_api.dart';
import 'package:presentation/src/screens/auth/phone/blocs/auth_phone_cubit/auth_phone_state.dart';

class AuthPhoneCubit extends Cubit<AuthPhoneState> {
  AuthPhoneCubit({required this.challengeUseCase, required this.verifyUseCase, required this.saveAuthTokenUseCase})
    : super(const AuthPhoneState.initial());
  final ChallengeUseCase challengeUseCase;
  final VerifyUseCase verifyUseCase;
  final SaveAuthTokenUseCase saveAuthTokenUseCase;

  Future<void> challenge(String phone) async {
    emit(const AuthPhoneState.challenging());

    final result = await challengeUseCase.invoke(phone);

    result.fold(
      onFailure: (exc) {
        emit(AuthPhoneState.challenged(error: exc.message, challenge: null));
      },
      onSuccess: (v) => emit(AuthPhoneState.challenged(error: null, challenge: v)),
    );
  }

  Future<void> verify({required String challengeId, required String code}) async {
    final params = VerifyParams(challenge: challengeId, code: code);
    emit(const AuthPhoneState.verifying());

    final result = await verifyUseCase.invoke(params);

    await result.fold(
      onFailure: (exc) async {
        emit(AuthPhoneState.verified(error: exc.message, authToken: null));
      },
      onSuccess: (v) async {
        log(v.toData().toString());
        await saveAuthTokenUseCase.invoke(v);
        emit(AuthPhoneState.verified(error: null, authToken: v));
      },
    );
  }

  Future<void> resend(String phone) async {
    emit(const AuthPhoneState.resending());

    final result = await challengeUseCase.invoke(phone);

    result.fold(
      onFailure: (exc) {
        emit(AuthPhoneState.resent(error: exc.message, challenge: null));
      },
      onSuccess: (v) => emit(AuthPhoneState.resent(error: null, challenge: v)),
    );
  }
}
