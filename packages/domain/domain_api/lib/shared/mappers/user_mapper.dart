import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

extension UserMapper on User {
  UserDto toData() {
    return UserDto(
      id: id,
      fullName: fullName,
      profession: profession,
      sessions: sessions.map((e) => e.toData()).toList(),
    );
  }
}
