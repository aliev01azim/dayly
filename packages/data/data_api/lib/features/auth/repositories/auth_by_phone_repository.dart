
import 'package:domain_api/domain_api.dart';

abstract interface class AuthByPhoneRepository {
  Future<Challenge> challenge({required String phone});
  Future<AuthToken> verify({required String challenge,required String code});
  Future<AuthToken> refreshToken({required String token});
}
