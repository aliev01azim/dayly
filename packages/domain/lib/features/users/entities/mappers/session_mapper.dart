import 'package:data/data.dart';
import 'package:domain/domain.dart';

extension SessionMapper on Session {
  SessionDto toData() {
    return SessionDto(
      id: id,
      title: title,
      startTime: startTime,
      createdAt: createdAt,
      duration: duration,
      status: status,
      online: online,
      description: description,
    );
  }
}
