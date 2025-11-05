import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';


extension ChallengeToDomainMapper on ChallengeDto {
  Challenge toDomain() {
    return Challenge(
      id: id,
      expiresAt: expiresAt,
      phone: phone,
    );
  }
}
