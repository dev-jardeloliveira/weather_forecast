import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_forecast/core/constants/app_theme.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_vm.dart';
import 'package:weather_forecast/features/weather/presentation/views/weather_view.dart';

void main() {
  // CORREÇÃO: Garante a inicialização das bindings do Flutter antes de qualquer outra lógica
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: WeatherApp()));
}

class WeatherApp extends ConsumerWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ O tema vem do ViewModel!
    final theme = ref.watch(weatherViewModelProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // 🔴 IMPORTANTE: Use o themeMode baseado no estado
      themeMode: theme.appTheme.brightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light,
      home: FutureBuilder(
        future: waitDownloadFonts(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return const WeatherView();
        },
      ),
    );
  }

  Future<void> waitDownloadFonts() async {
    AppTheme.lightTheme;
    AppTheme.darkTheme;
    await GoogleFonts.pendingFonts();
  }
}
