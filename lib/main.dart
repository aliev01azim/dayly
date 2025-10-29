import 'package:flutter/material.dart';
import 'package:test_dayly/app.dart';
import 'package:test_dayly/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerGetIt();
  runApp(const MyApp());
}
