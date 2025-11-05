import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

class UsersRepositoryImpl implements UsersRepository {
  const UsersRepositoryImpl({required RemoteUsersDataSource remoteUsersDataSource})
    : _remoteUsersDataSource = remoteUsersDataSource;

  final RemoteUsersDataSource _remoteUsersDataSource;

  @override
  Future<List<User>> getUsers() async {
    final result = await _remoteUsersDataSource.getUsers();

    return result.map((e) => e.toDomain()).toList();
  }
}
