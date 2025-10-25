
import 'package:test_dayly/models/session_model.dart';

class UserModel {
  final String id;
  final String fullName;
  final String profession;
  final String? avatarUrl;
    final List<SessionModel> sessions;


  UserModel({
    required this.id,
    required this.fullName,
    required this.profession,
    this.avatarUrl,
        this.sessions = const [],

  });


  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      profession: map['profession'] as String,
      avatarUrl: map['avatarUrl'] != null ? map['avatarUrl'] as String : null,
       sessions: (map['sessions'] as List<dynamic>?)
              ?.map((e) => SessionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, profession: $profession, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.fullName == fullName &&
      other.profession == profession &&
      other.avatarUrl == avatarUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      fullName.hashCode ^
      profession.hashCode ^
      avatarUrl.hashCode;
  }

  UserModel copyWith({
    String? id,
    String? fullName,
    String? profession,
    String? avatarUrl,
    List<SessionModel>? sessions,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      profession: profession ?? this.profession,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      sessions: sessions ?? this.sessions,
    );
  }
}
