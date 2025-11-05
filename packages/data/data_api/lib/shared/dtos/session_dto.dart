import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SessionDto {
  const SessionDto({
    required this.id,
    required this.title,
    required this.startTime,
    this.status,
    this.online = false,
    this.description,
    required this.createdAt,
    required this.duration,
  });

  factory SessionDto.fromJson(Map<String, dynamic> json) => _$SessionDtoFromJson(json);

  final String id;
  final String title;
  final DateTime startTime;
  @SessionStatusConverter()
  final SessionStatus? status;
  final bool online;
  final String? description;
  final DateTime createdAt;
  final Duration duration;
}
