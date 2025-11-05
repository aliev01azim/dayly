import 'package:domain_api/domain_api.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.fullName,
    required this.profession,
    this.avatarUrl,
    this.sessions = const [],
  });

  final String id;
  final String fullName;
  final String profession;
  final String? avatarUrl;
  final List<Session> sessions;

  @override
  List<Object?> get props => [id, fullName, profession, avatarUrl, sessions];

  User copyWith({
    String? id,
    String? fullName,
    String? profession,
    String? avatarUrl,
    List<Session>? sessions,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      profession: profession ?? this.profession,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      sessions: sessions ?? this.sessions,
    );
  }
}
