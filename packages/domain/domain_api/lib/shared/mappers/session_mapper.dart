import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

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
