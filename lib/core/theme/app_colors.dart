import 'package:flutter/material.dart';

class AppColors {
  // Colores principales según el documento
  static const Color blue = Color(
    0xFF2196F3,
  ); // Azul para elementos interactivos
  static const Color black = Color(0xFF000000); // Negro para fondos principales
  static const Color yellow = Color(
    0xFFFFD700,
  ); // Amarillo para llamadas a acción
  static const Color white = Color(
    0xFFFFFFFF,
  ); // Blanco para texto y elementos secundarios

  // Grises para elementos secundarios
  static const Color greyLight = Color(0xFFF5F5F5);
  static const Color greyMedium = Color(0xFF9E9E9E);
  static const Color greyDark = Color(0xFF424242);

  // Colores de estado
  static const Color error = Color(0xFFE53935);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Colores de fondo
  static const Color backgroundPrimary = white;
  static const Color backgroundSecondary = greyLight;
  static const Color backgroundDark = black;

  // Colores de texto
  static const Color textPrimary = black;
  static const Color textSecondary = greyDark;
  static const Color textLight = greyMedium;
  static const Color textOnPrimary = white;
  static const Color textOnSecondary = black;

  // Colores de botones
  static const Color buttonPrimary = blue;
  static const Color buttonSecondary = yellow;
  static const Color buttonText = white;
  static const Color buttonTextSecondary = black;

  // Colores de bordes
  static const Color borderLight = greyLight;
  static const Color borderMedium = greyMedium;
  static const Color borderDark = greyDark;
}
