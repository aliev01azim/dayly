import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      themeMode: ThemeMode.light,
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarContrastEnforced: false,
          ),
          child: child!,
        );
      },
      // ),
    );
  }
}
