import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:presentation/presentation.dart';
import 'package:ui_kit/ui_kit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = appRouter;
    return 
    // MultiBlocProvider(
    //   providers: [
        // Тут можно добавить глобальные провайдеры Bloc
        // Locale, Theme, Auth...
      // ],
      // child: 
      MaterialApp.router(
        locale: const Locale('ru', 'RU'),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: AppTheme.light,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: child!,
          );
        },
        themeMode: ThemeMode.light,
      // ),
    );
  }
}
