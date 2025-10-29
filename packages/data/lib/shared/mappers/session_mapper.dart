import 'package:data/data.dart';
import 'package:domain/domain.dart';

extension SessionResponseMapper on SessionDto {
  Session toDomain() => Session(
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
