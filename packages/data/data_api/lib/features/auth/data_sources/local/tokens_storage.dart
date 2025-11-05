import 'package:data_api/data_api.dart';

abstract class TokensStorage {
  UserTokenDto? getUserAuthToken();

  void setUserToken(UserTokenDto? token);
}
