import 'package:domain_api/domain_api.dart';

abstract interface class StorageRepository {
  AuthToken? getUserAuthToken();

  void setUserToken(AuthToken? token);
}
