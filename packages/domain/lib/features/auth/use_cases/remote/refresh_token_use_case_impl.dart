import 'dart:async';
import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

class RefreshTokenUseCaseImpl extends RefreshTokenUseCase {
  RefreshTokenUseCaseImpl({required this.authByPhoneRepository});

  final AuthByPhoneRepository authByPhoneRepository;

  @override
  FutureOr<AuthToken> makeRequest(String token) {
    final result = authByPhoneRepository.refreshToken(token: token);
    return result;
  }
}
