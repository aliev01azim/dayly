
import 'package:domain_api/domain_api.dart';

abstract interface class UsersRepository {
  Future<List<User>> getUsers();
}
