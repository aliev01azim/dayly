import 'package:core_api/core_api.dart';
import 'package:domain_api/domain_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/screens/home/blocs/users/users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit({required this.getUsersUseCase}) : super(const UsersState.initial()) {
    loadUsers();
  }

  final GetUsersUseCase getUsersUseCase;

  Future<void> loadUsers() async {
    emit(const UsersState.loading());

    await Future.delayed(const Duration(seconds: 2));
    final result = await getUsersUseCase.invoke(const EmptyUseCaseParams());

    result.fold(
      onFailure: (exc) {
        emit(UsersState.error(exc.message.toString()));
      },
      onSuccess: (v) => emit(UsersState.loaded(v)),
    );
  }

  void addSession(Session newSession, User user) {
    final users = <User>[...state.mapOrNull(loaded: (state) => state.users) ?? []];

    final userIndex = users.indexWhere((u) => u.id == user.id);
    if (userIndex != -1) {
      final updatedUser = user.copyWith(sessions: [...user.sessions, newSession]);
      users[userIndex] = updatedUser;
      emit(UsersState.loaded(users)); 
    }
  }
}
