import 'package:data_api/data_api.dart';

abstract interface class RemoteAuthByPhoneDataSource {
  Future<ChallengeDto> challenge({required String phone});
  Future<UserTokenDto> verify({required String challenge,required String code});
  Future<UserTokenDto> refreshToken({required String token});
}
