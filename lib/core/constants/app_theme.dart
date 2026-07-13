// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_forecast/core/constants/app_color.dart';
import 'package:weather_forecast/core/extensions/weather_theme_extension.dart';

class AppTheme {
  // ============================================================
  // TEMA ESCURO (DARK THEME)
  // ============================================================
  // Este tema é ativado quando o usuário seleciona o modo escuro
  // ou quando o sistema está em modo escuro (se configurado)
  // ============================================================
  static ThemeData get darkTheme => ThemeData(
    // HABILITA O MATERIAL DESIGN 3
    // ------------------------------------------------
    // O Material 3 é a versão mais recente do Material Design
    // com cores dinâmicas, cantos arredondados e animações modernas
    useMaterial3: true,

    // DEFINE O BRILHO (BRIGHTNESS)
    // ------------------------------------------------
    // Brightness.dark: Fundos escuros, textos claros
    // Brightness.light: Fundos claros, textos escuros
    brightness: Brightness.dark,

    // COR DE FUNDO DO SCAFFOLD
    // ------------------------------------------------
    // Cor de fundo padrão para telas (Scaffold)
    // No tema escuro, usamos um cinza bem escuro (#121212)
    scaffoldBackgroundColor: AppColor.backgroundDark,

    // ESQUEMA DE CORES COMPLETO (COLOR SCHEME)
    // ------------------------------------------------
    // O ColorScheme define TODAS as cores do tema de forma consistente
    // É mais completo que o primarySwatch e usado pelo Material 3
    colorScheme: const ColorScheme.dark(
      // Cores principais
      primary: AppColor.primaryColor, // Cor principal
      secondary: AppColor.colorScheme, // Cor secundária (destaques)
      // Cores de superfície
      surface: AppColor.surfaceDark, // Fundo de cards, dialogs, etc.
      // Cores de erro
      error: Colors.red, // Cor para mensagens de erro
      // Cores para textos e ícones sobre cada fundo
      onPrimary: Colors.white, // Texto sobre primary
      onSecondary: Colors.white, // Texto sobre secondary
      onSurface: Colors.white, // Texto sobre surface
      onError: Colors.white, // Texto sobre error
    ),

    // ESTILO DA APPBAR
    // ------------------------------------------------
    // Configura a barra superior do app
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.surfaceDark, // Fundo da AppBar
      foregroundColor: Colors.white, // Cor dos ícones e textos
      elevation: 0, // Sombra (0 = sem sombra)
      centerTitle: true, // Centraliza o título
    ),

    // ESTILO DOS CARDS
    // ------------------------------------------------
    // Configura todos os widgets Card do app
    cardTheme: CardThemeData(
      color: AppColor.surfaceDark, // Fundo do card
      elevation: 2, // Sombra (quanto maior, mais sombra)
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Cantos arredondados
      ),
    ),

    // ESTILO DOS TEXTOS (TEXT THEME)
    // ------------------------------------------------
    // Define como todos os textos vão aparecer
    // Cada estilo tem um nome e pode ser usado com:
    // TextStyle() ou Theme.of(context).textTheme.displayLarge
    textTheme: GoogleFonts.poppinsTextTheme(
      const TextTheme(
        // Títulos grandes (Display)
        displayLarge: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),

        // Títulos (Headline)
        headlineMedium: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),

        // Títulos menores (Title)
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),

        // Corpo do texto (Body)
        bodyLarge: TextStyle(
          color: Colors.white70, // 70% de opacidade (mais suave)
          fontSize: 16,
        ),
        bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
        bodySmall: TextStyle(
          color: Colors.white54, // 54% de opacidade (ainda mais suave)
          fontSize: 12,
        ),
      ),
    ),

    // ESTILO DOS ÍCONES
    // ------------------------------------------------
    // Define a cor e tamanho padrão dos ícones
    iconTheme: const IconThemeData(color: Colors.white, size: 24),

    // ESTILO DOS BOTÕES ELEVADOS
    // ------------------------------------------------
    // Configura todos os ElevatedButton do app
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor, // Fundo do botão
        foregroundColor: Colors.white, // Cor do texto/ícone
        minimumSize: const Size(
          double.infinity,
          48,
        ), // Largura total, altura 48
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Cantos arredondados
        ),
      ),
    ),

    // ESTILO DOS CAMPOS DE INPUT
    // ------------------------------------------------
    // Configura todos os TextField, TextFormField, etc.
    inputDecorationTheme: InputDecorationTheme(
      filled: true, // Fundo preenchido
      fillColor: AppColor.surfaceDark, // Cor do fundo
      floatingLabelStyle: const TextStyle(
        color: AppColor.primaryColor,
      ), // Cor do label flutuante
      // Borda padrão (quando não está focado)
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none, // Sem borda
      ),

      // Borda quando está habilitado mas não focado
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade800),
      ),

      // Borda quando está focado (digitando)
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
      ),

      // Estilo do label (texto da dica)
      labelStyle: const TextStyle(color: Colors.white70),
      hintStyle: const TextStyle(color: Colors.white54),
    ),

    // ESTILO DOS INDICADORES DE PROGRESSO
    // ------------------------------------------------
    // Configura CircularProgressIndicator e LinearProgressIndicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColor.primaryColor, // Cor do progresso
      circularTrackColor: Colors.grey, // Cor do fundo do círculo
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColor.surfaceDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColor.surfaceDark,
      elevation: 4,
      shadowColor: AppColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
      thickness: 1,
      space: 1,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColor.surfaceDark,
      contentTextStyle: TextStyle(color: Colors.white),
      actionTextColor: AppColor.primaryColor,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColor.primaryColor),
      checkColor: WidgetStateProperty.all(Colors.white),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColor.primaryColor),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColor.white),
      trackColor: WidgetStateProperty.all(AppColor.black),
    ),
    extensions: [
      WeatherThemeExtension(
        backgroundGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1a1a2e), // Azul escuro
            Color(0xFF16213e), // Azul médio
            Color(0xFF0f3460), // Azul mais claro
          ],
        ),
        cardColor: const Color(0xFF2d2d44),
        detalheIconColor: Colors.blueAccent,
      ),
    ],
  );

  // ============================================================
  // TEMA CLARO (LIGHT THEME)
  // ============================================================
  // Este tema é ativado quando o usuário seleciona o modo claro
  // ou quando o sistema está em modo claro
  // ============================================================
  static ThemeData get lightTheme => ThemeData(
    // HABILITA O MATERIAL DESIGN 3
    useMaterial3: true,

    // DEFINE O BRILHO (BRIGHTNESS)
    // ------------------------------------------------
    // No tema claro, fundos são claros e textos escuros
    brightness: Brightness.light,

    // COR DE FUNDO DO SCAFFOLD
    // ------------------------------------------------
    // No tema claro, usamos um cinza bem claro
    scaffoldBackgroundColor: AppColor.backgroundLight,

    // ESQUEMA DE CORES COMPLETO
    colorScheme: const ColorScheme.light(
      primary: AppColor.primaryColor,
      secondary: AppColor.colorScheme,

      // Cores de superfície (claras)
      surface: AppColor.surfaceLight,

      error: Colors.red,

      // Textos escuros sobre fundos claros
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black87,
      onError: Colors.white,
    ),

    // ESTILO DA APPBAR
    // ------------------------------------------------
    // No tema claro, a AppBar usa a cor primária
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),

    // ESTILO DOS CARDS
    cardTheme: CardThemeData(
      color: AppColor.surfaceLight, // Card branco
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // ESTILO DOS TEXTOS
    // ------------------------------------------------
    // Textos escuros para contraste com fundo claro
    textTheme: GoogleFonts.poppinsTextTheme(
      const TextTheme(
        displayLarge: TextStyle(
          color: Colors.black87,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: Colors.black87,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: Colors.black87,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(color: Colors.black87, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
        bodySmall: TextStyle(
          color: Colors.black54, // 54% opacidade (mais suave)
          fontSize: 12,
        ),
      ),
    ),

    // ESTILO DOS ÍCONES
    iconTheme: const IconThemeData(color: Colors.black87, size: 24),

    // ESTILO DOS BOTÕES ELEVADOS
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    // ESTILO DOS CAMPOS DE INPUT
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.surfaceLight, // Fundo branco

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300), // Cinza claro
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
      ),
      floatingLabelStyle: const TextStyle(color: AppColor.primaryColor),
      labelStyle: TextStyle(color: Colors.grey.shade600),
      hintStyle: const TextStyle(color: Colors.black54),
    ),

    // ESTILO DOS INDICADORES DE PROGRESSO
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColor.primaryColor,
      circularTrackColor: Colors.grey,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColor.surfaceLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColor.surfaceLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey.shade300,
      thickness: 1,
      space: 1,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColor.surfaceLight,
      contentTextStyle: TextStyle(color: Colors.black87),
      actionTextColor: AppColor.primaryColor,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColor.primaryColor),
      checkColor: WidgetStateProperty.all(Colors.white),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColor.primaryColor),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColor.primaryColor),
      trackColor: WidgetStateProperty.all(
        AppColor.primaryColor.withValues(alpha: 0.5),
      ),
    ),
    extensions: [
      WeatherThemeExtension(
        backgroundGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFa1c4fd), // Azul claro
            Color(0xFFc2e9fb), // Azul mais claro
          ],
        ),
        cardColor: const Color(0xFFffffff),
        detalheIconColor: Colors.blueAccent,
      ),
    ],
  );
}

// ============================================================
// GUIA RÁPIDO DE USO
// ============================================================
/*
  COMO USAR AS CORES NO APP:
  
  1. Cor de fundo da tela:
     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  
  2. Cor do texto:
     style: Theme.of(context).textTheme.bodyLarge,
  
  3. Cor primária:
     color: Theme.of(context).primaryColor,
  
  4. Cor secundária:
     color: Theme.of(context).colorScheme.secondary,
  
  5. Cor de superfície (cards):
     color: Theme.of(context).cardColor,
  
  6. Cor de erro:
     color: Theme.of(context).colorScheme.error,
  
  7. Texto adaptativo (claro/escuro):
     style: TextStyle(
       color: Theme.of(context).colorScheme.onSurface,
     ),
*/

// ============================================================
// DICAS DE BOAS PRÁTICAS
// ============================================================
/*
  1. SEMPRE use Theme.of(context) em vez de cores fixas
     ✅ Theme.of(context).primaryColor
     ❌ Colors.blue
  
  2. Para textos, use o textTheme
     ✅ Theme.of(context).textTheme.bodyLarge
     ❌ TextStyle(fontSize: 16, color: Colors.black)
  
  3. Para cores adaptativas, use o ColorScheme
     ✅ Theme.of(context).colorScheme.secondary
     ❌ AppColor.colorScheme (não vai mudar com o tema)
  
  4. Teste SEMPRE nos dois temas
     - Use o botão de toggle no app
     - Ou mude nas configurações do emulador
  
  5. Para imagens e ícones, considere ter versões para cada tema
     - dark_logo.png e light_logo.png
     - Ou use ícones com cores adaptativas
*/
