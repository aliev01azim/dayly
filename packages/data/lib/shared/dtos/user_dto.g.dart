// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  id: json['id'] as String,
  fullName: json['fullName'] as String,
  profession: json['profession'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  sessions:
      (json['sessions'] as List<dynamic>?)
          ?.map((e) => SessionDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'profession': instance.profession,
  'avatarUrl': instance.avatarUrl,
  'sessions': instance.sessions,
};
