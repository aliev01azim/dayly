import 'package:core/core.dart' show registerCoreAsyncServices;
import 'package:data/data.dart' show registerDataAsyncServices;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_dayly/app.dart';
import 'package:test_dayly/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await registerCoreAsyncServices();
  await registerDataAsyncServices();
  await registerGetIt();
  runApp(const MyApp());
}
