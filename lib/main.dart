import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_dayly/controllers/calendar_controller.dart';
import 'package:test_dayly/controllers/users_controller.dart';
import 'package:test_dayly/widgets/calendar_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
 await initializeDateFormatting('ru', null);
   Get.put<CalendarController>(CalendarController());
   Get.put<UsersController>(UsersController());
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('ru', 'RU'),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      theme: ThemeData(
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
       builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: const TextScaler.linear(1),
        ),
        child: child!,
      );
    },
      themeMode: ThemeMode.light,
      home: CalendarPage(),
    );
  }
}
