import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:domain/features/users/entities/mappers/session_mapper.dart';

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
