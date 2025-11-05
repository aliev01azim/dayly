import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

Future registerCoreAsyncServices() async {
  //root independent: firebase app, Hive
  await Future.wait([
    Hive.initFlutter(),
    // Firebase.initializeApp(),
  ]);

  await initializeDateFormatting('ru_RU');
}
