import 'package:equatable/equatable.dart';

class Challenge extends Equatable {
  const Challenge({required this.expiresAt, required this.id,required this.phone});
  final String id;
  final String phone;
  final DateTime expiresAt;
  @override
  // TODO: implement props
  List<Object?> get props => [id, expiresAt,phone];
}
