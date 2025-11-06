import 'dart:async';

import 'package:data_api/data_api.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TokensStorageImpl implements TokensStorage {
  static const String _boxName = 'TokensStorage';

  static Future<void> initHive() {
    return Hive.openBox<Map<dynamic, dynamic>?>(_boxName);
  }

  final _hiveBox = Hive.box<Map<dynamic, dynamic>?>(_boxName);

  @override
  UserTokenDto? getUserAuthToken() {
    // _hiveBox.clear();

    final token = _hiveBox.get(_Keys.authToken.name);
    return token != null ? UserTokenDto.fromJson(token) : null;
  }

  @override
  void setUserToken(UserTokenDto? token) {
    _hiveBox.put(_Keys.authToken.name, token?.toJson());
  }
}

enum _Keys { authToken }
