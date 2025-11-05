import 'dart:async';

import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

class ChallengeUseCaseImpl extends ChallengeUseCase {
  ChallengeUseCaseImpl({required this.authByPhoneRepository});

  final AuthByPhoneRepository authByPhoneRepository;

  @override
  FutureOr<Challenge> makeRequest(String phone) {
    final result = authByPhoneRepository.challenge(phone: phone);
    return result;
  }
}
