import 'package:core_api/core_api.dart';
import 'package:data_api/data_api.dart';

class RemoteAuthByPhoneDataSourceImpl implements RemoteAuthByPhoneDataSource {
  const RemoteAuthByPhoneDataSourceImpl({required HttpClient client}) : _client = client;

  final HttpClient _client;
  @override
  Future<ChallengeDto> challenge({required String phone}) async {
    final response = await _client.execute<Map<String, dynamic>>(
      method: 'post',
      url: 'main/public/phone_auth_challenges',
      data: {'phone': phone},
    );

    final jsonData = response.data;

    if (jsonData == null && jsonData is! Map<String, dynamic>) {
      throw const AuthException(message: 'Ошибка');
    }

    return ChallengeDto.fromJson(jsonData);
  }

  @override
  Future<UserTokenDto> verify({required String challenge, required String code}) async {
    final response = await _client.execute<Map<String, dynamic>>(
      method: 'post',
      url: 'main/public/phone-auth/verify',
      data: {'challenge': '/main/phone_auth_challenges/$challenge', 'code': code},
    );

    final jsonData = response.data;

    if (jsonData == null && jsonData is! Map<String, dynamic>) {
      throw const AuthException(message: 'Ошибка');
    }

    return UserTokenDto.fromJson(jsonData);
  }
}
