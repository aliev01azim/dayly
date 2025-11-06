import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

extension TokenToDomainMapper on UserTokenDto {
  AuthToken toDomain() {
    return AuthToken(
      accessToken: tokens?.accessToken,
      refreshToken: tokens?.refreshToken,
      expiresIn: expiresIn,
      tokenType: tokens?.tokenType,
      mode: mode,
      success: success,
      message: message,
    );
  }
}
