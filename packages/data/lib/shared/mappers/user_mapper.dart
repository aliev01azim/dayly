
import 'package:data/shared/dtos/user_dto.dart';
import 'package:data/shared/mappers/session_mapper.dart';
import 'package:domain/domain.dart';

extension UserResponseMapper on UserDto {
  User toDomain() => User(
        id: id,
        fullName: fullName,
        profession: profession,
        avatarUrl: avatarUrl,
        sessions: sessions.map((dto) => dto.toDomain()).toList(),
      );
}
