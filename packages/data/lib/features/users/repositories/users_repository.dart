
import 'package:domain/domain.dart';

abstract interface class UsersRepository {
  Future<List<User>> getUsers();
}
