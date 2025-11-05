import 'package:json_annotation/json_annotation.dart';

part 'challenge_dto.g.dart';

@JsonSerializable()
class ChallengeDto {
  const ChallengeDto({
    required this.id,
    required this.expiresAt,
    required this.phone,
  });

  factory ChallengeDto.fromJson(Map<String, dynamic> json) => _$ChallengeDtoFromJson(json);

  final String id;
  final DateTime expiresAt;
  final String phone;
}
