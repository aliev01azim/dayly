import 'dart:async';

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class GetUsersUseCase extends UseCase<List<User>, EmptyUseCaseParams> {}

class GetUsersUseCaseImpl extends GetUsersUseCase {
  GetUsersUseCaseImpl({required this.usersRepository});

  final UsersRepository usersRepository;

  @override
  FutureOr<List<User>> makeRequest(_) async {
    final result = await usersRepository.getUsers();
    return result;
  }
}
