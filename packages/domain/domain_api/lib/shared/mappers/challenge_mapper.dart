import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

extension ChallengeMapper on Challenge {
  ChallengeDto toData() {
    return ChallengeDto(id: id, expiresAt: expiresAt, phone: phone);
  }
}
