import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Session extends Equatable {
  const Session({
    required this.id,
    required this.title,
    required this.startTime,
    this.status,
    this.online = false,
    this.description,
    required this.createdAt,
    required this.duration,
  });

  final String id;
  final String title;
  final DateTime startTime;
  final SessionStatus? status;
  final bool online;
  final String? description;
  final DateTime createdAt;
  final Duration duration;

  @override
  List<Object?> get props => [id, title, startTime, status, online, description, createdAt, duration];
}

@JsonEnum()
enum SessionStatus {
  confirmed, // подтвердил
  attended, // пришел
  missed, // не пришел
}

