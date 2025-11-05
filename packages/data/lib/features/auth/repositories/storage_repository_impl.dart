import 'package:data_api/data_api.dart';
import 'package:domain_api/domain_api.dart';

class StorageRepositoryImpl implements StorageRepository {
  StorageRepositoryImpl({required this.tokensStorage});
  final TokensStorage tokensStorage;
  @override
  AuthToken? getUserAuthToken() {
    final result = tokensStorage.getUserAuthToken();
    return result?.toDomain();
  }

  @override
  void setUserToken(AuthToken? token) {
    tokensStorage.setUserToken(token?.toData());
  }
}
