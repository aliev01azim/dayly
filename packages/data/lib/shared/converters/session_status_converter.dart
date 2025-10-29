import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

class SessionStatusConverter implements JsonConverter<SessionStatus?, String?> {
  const SessionStatusConverter();

  @override
  SessionStatus? fromJson(dynamic json) {
    if (json is String && json.isNotEmpty) {
      try {
        return SessionStatus.values.byName(json.toLowerCase());
      } catch (_) {
        return SessionStatus.missed; // дефолт
      }
    }
    return null;
  }

  @override
  String? toJson(SessionStatus? object) => object?.name;
}
