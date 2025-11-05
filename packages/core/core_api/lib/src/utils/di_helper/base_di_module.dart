import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

abstract class BaseDiModule implements DiGetterInterface {
  const BaseDiModule({this.dependencies = const []});

  final List<BaseDiModule> dependencies;

  String get scopeName => toString();

  /// Нужно, чтобы если несколько виджетов используют один модуль, scope не удалялся преждевременно.
  static final Map<String, int> _launchedScopes = {};

  void init() {
    for (final dependency in dependencies) {
      dependency.init();
    }
    initModule(_getIt);
  }

  @override
  bool isRegistered<T extends Object>() => _getIt.isRegistered<T>();

  @override
  T get<T extends Object>({String? instanceName, dynamic param1, dynamic param2}) {
    return _getIt.get(instanceName: instanceName, param1: param1, param2: param2);
  }

  void initModule(GetIt getIt);

  void pushScope() {
    final count = _launchedScopes[scopeName];
    if (count == null) {
      /// Cкоуп не запущен, запускаем
      _getIt.pushNewScope(scopeName: scopeName);
      _launchedScopes[scopeName] = 1;
      init();
    } else {
      /// Cкоуп запущен, считаем ссылки
      _launchedScopes[scopeName] = count + 1;
    }
  }

  Future<void> popScope() async {
    final count = _launchedScopes[scopeName];
    if (count == 1) {
      /// Скоуп запущен, 1 ссылка, дропаем
      await _getIt.dropScope(scopeName);
      _launchedScopes.remove(scopeName);
    } else if (count == null || count == 0) {
      throw Exception('Cannot call popScope because it is not launched');
    } else {
      /// Скоуп запущен, ссылкок много, считаем
      _launchedScopes[scopeName] = count - 1;
    }
  }
}

abstract interface class DiGetterInterface {
  bool isRegistered<T extends Object>();

  T get<T extends Object>({String? instanceName, dynamic param1, dynamic param2});
}
