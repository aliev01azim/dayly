import 'dart:async';

import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';


class GetUsersUseCaseImpl extends GetUsersUseCase {
  GetUsersUseCaseImpl({required this.usersRepository});

  final UsersRepository usersRepository;

  @override
  FutureOr<List<User>> makeRequest(_) async {
    final result = await usersRepository.getUsers();
    return result;
  }
}
