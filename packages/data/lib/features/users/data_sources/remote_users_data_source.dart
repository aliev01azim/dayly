import 'package:data/data.dart';

abstract interface class RemoteUsersDataSource {
  Future<List<UserDto>> getUsers();
}
