import 'package:domain_api/domain_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = _Initial;
  const factory UsersState.loading() = _Loading;
  const factory UsersState.loaded(List<User> users) = _Loaded;
  const factory UsersState.error(String message) = _Error;
}

extension UsersStateX on UsersState {
  bool get isLoading => maybeMap(
        loading: (_) => true,
        orElse: () => false,
      );
}
