import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

extension TokenToDataMapper on AuthToken {
  UserTokenDto toData() {
    return UserTokenDto(
      tokens: TokensDto(accessToken: accessToken, refreshToken: refreshToken,tokenType: tokenType),
      expiresIn: expiresIn,
      mode: mode,
      success: success,
      message: message,
    );
  }
}
