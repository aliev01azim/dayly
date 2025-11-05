import 'package:equatable/equatable.dart';

class AuthToken extends Equatable {
  const AuthToken({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.tokenType,
    required this.mode,
    required this.success,
    required this.message,
  });

  //не null только при mode="login"
  final String? accessToken;
  //не null только при mode="login"
  final String? refreshToken;
  //Время жизни токена в секундах
  final int? expiresIn;
  //Тип токена (обычно "Bearer")
  final String? tokenType;
  //"login": Пользователь найден, возвращены токены Keycloak
  //либо
  //"verified": Код верный, но пользователь не найден в системе
  final String mode;
  //Успешность операции
  final bool success;
  //Сообщение о результате
  final String message;

  @override
  List<Object?> get props => [accessToken, refreshToken, expiresIn, tokenType, mode, success, message];
}
