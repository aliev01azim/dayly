import 'package:data_api/data_api.dart';

abstract interface class RemoteUsersDataSource {
  Future<List<UserDto>> getUsers();
}
