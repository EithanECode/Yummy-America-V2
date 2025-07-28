import 'package:flutter/material.dart';
import '../../pages/splash_page.dart';
import '../../pages/welcome_page.dart';
import '../../pages/login_page.dart';
import '../../pages/register_page.dart';
import '../../pages/verification_page.dart';
import '../../pages/map_page.dart';
import '../../pages/phone_verification_page.dart';
import '../../pages/add_phone_page.dart';

class AppRouter {
  // Rutas de la aplicación
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String verification = '/verification';
  static const String map = '/map';
  static const String phoneVerification = '/phone-verification';
  static const String addPhone = '/add-phone';

  // Generador de rutas
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );

      case welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomePage(),
          settings: settings,
        );



      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );

      case register:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
          settings: settings,
        );

      case verification:
        return MaterialPageRoute(
          builder: (_) => const VerificationPage(),
          settings: settings,
        );

      case map:
        return MaterialPageRoute(
          builder: (_) => const MapPage(),
          settings: settings,
        );

      case phoneVerification:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => PhoneVerificationPage(
            phoneNumber: args?['phoneNumber'] ?? '',
            isFromGoogle: args?['isFromGoogle'] ?? false,
          ),
          settings: settings,
        );

      case addPhone:
        return MaterialPageRoute(
          builder: (_) => const AddPhonePage(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );
    }
  }

  // Métodos de navegación
  static void navigateTo(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void navigateToReplacement(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static void navigateToAndClear(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static void goBackTo(BuildContext context, String routeName) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }
}
