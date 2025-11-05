import 'dart:async';
import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

class VerifyUseCaseImpl extends VerifyUseCase {
  VerifyUseCaseImpl({required this.authByPhoneRepository});

  final AuthByPhoneRepository authByPhoneRepository;

  @override
  FutureOr<AuthToken> makeRequest(VerifyParams params) {
    final result = authByPhoneRepository.verify(challenge: params.challenge, code: params.code);
    return result;
  }
}
