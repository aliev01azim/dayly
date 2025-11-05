import 'package:data_api/data_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserDto {
  const UserDto({
    required this.id,
    required this.fullName,
    required this.profession,
    this.avatarUrl,
    this.sessions = const [],
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  final String id;
  final String fullName;
  final String profession;
  final String? avatarUrl;
  final List<SessionDto> sessions;
}
