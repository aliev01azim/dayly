import 'package:json_annotation/json_annotation.dart';

part 'user_token_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserTokenDto {
  const UserTokenDto({
    required this.tokens,
    required this.expiresIn,
    required this.tokenType,
    required this.mode,
    required this.success,
    required this.message,
  });

  factory UserTokenDto.fromJson(Map<dynamic, dynamic> json) => _$UserTokenDtoFromJson(Map<String, dynamic>.from(json));

  Map<String, dynamic> toJson() => _$UserTokenDtoToJson(this);

  final TokensDto? tokens;
  final int? expiresIn;
  final String? tokenType;
  final String mode;
  final bool success;
  final String message;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TokensDto {
  const TokensDto({required this.accessToken, required this.refreshToken});

  factory TokensDto.fromJson(Map<dynamic, dynamic> json) => _$TokensDtoFromJson(Map<String, dynamic>.from(json));

  Map<String, dynamic> toJson() => _$TokensDtoToJson(this);

  final String? accessToken;
  final String? refreshToken;
}
