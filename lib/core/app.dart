import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'theme/app_theme.dart';
import 'routes/app_router.dart';

class YummyApp extends StatelessWidget {
  const YummyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRouter.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
