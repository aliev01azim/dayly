// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionDto _$SessionDtoFromJson(Map<String, dynamic> json) => SessionDto(
  id: json['id'] as String,
  title: json['title'] as String,
  startTime: DateTime.parse(json['startTime'] as String),
  status: const SessionStatusConverter().fromJson(json['status'] as String?),
  online: json['online'] as bool? ?? false,
  description: json['description'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  duration: Duration(microseconds: (json['duration'] as num).toInt()),
);

Map<String, dynamic> _$SessionDtoToJson(SessionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'startTime': instance.startTime.toIso8601String(),
      'status': const SessionStatusConverter().toJson(instance.status),
      'online': instance.online,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'duration': instance.duration.inMicroseconds,
    };
