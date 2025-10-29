import 'package:data/data.dart';
import 'package:domain/domain.dart';

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
