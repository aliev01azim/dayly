import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

class AuthByPhoneRepositoryImpl implements AuthByPhoneRepository {
  AuthByPhoneRepositoryImpl({required this.remoteAuthByPhoneDataSource});
  final RemoteAuthByPhoneDataSource remoteAuthByPhoneDataSource;
  @override
  Future<Challenge> challenge({required String phone}) async {
    final challengeDto = await remoteAuthByPhoneDataSource.challenge(phone: phone);
    return challengeDto.toDomain();
  }

  @override
  Future<AuthToken> verify({required String challenge, required String code}) async {
    final authTokenDto = await remoteAuthByPhoneDataSource.verify(challenge: challenge, code: code);
    return authTokenDto.toDomain();
  }
}
