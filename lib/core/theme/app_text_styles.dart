import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Estilos de texto principales
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: -0.25,
  );

  static const TextStyle headline4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: -0.15,
  );

  static const TextStyle headline5 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: -0.15,
  );

  static const TextStyle headline6 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: -0.15,
  );

  // Estilos de texto de cuerpo
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    letterSpacing: 0.15,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    letterSpacing: 0.25,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    letterSpacing: 0.4,
  );

  // Estilos de texto de botones
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.buttonText,
    letterSpacing: 0.5,
  );

  static const TextStyle buttonTextSecondary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.buttonTextSecondary,
    letterSpacing: 0.5,
  );

  // Estilos de texto de entrada
  static const TextStyle inputText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    letterSpacing: 0.15,
  );

  static const TextStyle inputHint = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textLight,
    letterSpacing: 0.15,
  );

  // Estilos de texto de AppBar
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.15,
  );

  // Estilos de texto de etiquetas
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    letterSpacing: 0.1,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 0.5,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textLight,
    letterSpacing: 0.5,
  );

  // Estilos de texto de captión
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    letterSpacing: 0.4,
  );

  // Estilos de texto de overline
  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.textLight,
    letterSpacing: 1.5,
  );
}
