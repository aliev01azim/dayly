import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

extension UserToDomainMapper on UserDto {
  User toDomain() {
    return User(
      id: id,
      fullName: fullName,
      profession: profession,
      avatarUrl: avatarUrl,
      sessions: sessions.map((e) => e.toDomain()).toList(),
    );
  }
}
