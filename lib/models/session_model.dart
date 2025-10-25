import 'package:flutter/material.dart';
import 'package:test_dayly/heplers/colors.dart';

class SessionModel {
  final String id;
  final String title;
  final DateTime startTime;
  final SessionStatus? status;
  final bool online;
  final String? description;
  final DateTime createdAt;
  final Duration duration;

  SessionModel({
    required this.id,
    required this.title,
    required this.startTime,
    this.status,
    this.online = false,
    this.description,
    required this.createdAt,
    required this.duration,
  });

  SessionModel copyWith({
    String? id,
    String? title,
    DateTime? startTime,
    SessionStatus? status,
    bool? isNormal,
    String? description,
    DateTime? createdAt,
    Duration? duration,
  }) {
    return SessionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      startTime: startTime ?? this.startTime,
      status: status ?? this.status,
      online: isNormal ?? this.online,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      duration: duration ?? this.duration,
    );
  }

  factory SessionModel.fromJson(Map<String, dynamic> map) {
    return SessionModel(
      id: map['id'] as String,
      title: map['title'] as String,
      startTime: DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int),
      status: map['status'] != null
          ? SessionStatus.values.firstWhere((e) => e.name == map['status'], orElse: () => SessionStatus.missed)
          : null,
      online: map['isNormal'] as bool,
      description: map['description'] != null ? map['description'] as String : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      duration: Duration(minutes: map['duration'] as int),
    );
  }

  @override
  String toString() {
    return 'SessionModel(id: $id, title: $title, startTime: $startTime, status: $status, isNormal: $online, description: $description, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant SessionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.startTime == startTime &&
        other.status == status &&
        other.online == online &&
        other.description == description &&
        other.duration == duration &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        startTime.hashCode ^
        status.hashCode ^
        online.hashCode ^
        description.hashCode ^
        duration.hashCode ^
        createdAt.hashCode;
  }
}

enum SessionStatus {
  confirmed, // подтвердил
  attended, // пришел
  missed, // не пришел
}

extension SessionStatusExtension on SessionStatus {
  Color get color {
    switch (this) {
      case SessionStatus.confirmed:
        return Colors.black; // подтверждено
      case SessionStatus.attended:
        return green; // пришел
      case SessionStatus.missed:
        return red; // не пришел
    }
  }

  Color get bgcolor {
    switch (this) {
      case SessionStatus.confirmed:
        return red; // подтверждено
      case SessionStatus.attended:
        return blue; // пришел
      case SessionStatus.missed:
        return blue; // не пришел
    }
  }

  String get text {
    switch (this) {
      case SessionStatus.confirmed:
        return 'Подтвердил';
      case SessionStatus.attended:
        return 'Пришел'; //
      case SessionStatus.missed:
        return 'Не пришел';
    }
  }

  IconData get icon {
    switch (this) {
      case SessionStatus.confirmed:
        return Icons.check;
      case SessionStatus.attended:
        return Icons.add; //
      case SessionStatus.missed:
        return Icons.remove;
    }
  }
}
