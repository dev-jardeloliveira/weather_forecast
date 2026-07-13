import 'package:flutter/material.dart';

class AppColor {
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF2196F3,
    <int, Color>{
      50: Color(0xFFE3F2FD), // Azul bem claro
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF2196F3), // Azul padrão (Colors.blue)
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1), // Azul bem escuro
    },
  );

  static const Color primaryColor = Color(0xFF2196F3);
  static const Color primaryColorLight = Color(0xFF90CAF9);
  static const Color primaryColorDark = Color(0xFF0D47A1);
  static const Color colorScheme = Color(0xFF5F9AF8);

  // Cores adicionais para o tema escuro
  static const Color surfaceDark = Color(0xFF222222);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceLight = Color(0xFFE3F2FD);
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color black = Color(0xFF1E1E1E);
  static const Color white = Color(0xFFFFFFFF);
  //Cores adicionais
}
