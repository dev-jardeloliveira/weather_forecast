import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/constants/app_color.dart';
import 'package:weather_forecast/core/constants/app_size.dart';
import 'package:weather_forecast/core/constants/app_string.dart';
import 'package:weather_forecast/core/enums/weather_type_enum.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_vm.dart';
import 'package:weather_forecast/features/weather/presentation/widgets/button_theme_widget.dart';
import 'package:weather_forecast/features/weather/presentation/widgets/card_current_widget.dart';
import 'package:weather_forecast/features/weather/presentation/widgets/search_widget.dart';
import 'package:weather_forecast/features/weather/presentation/widgets/weather_data_forecast_widgets.dart';

class WeatherView extends ConsumerStatefulWidget {
  const WeatherView({super.key});

  @override
  ConsumerState<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends ConsumerState<WeatherView> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(weatherViewModelProvider);

    int? weatherCode = currentTheme.weatherCurrentDto?.current.condition.code;
    DateTime? timestamp =
        currentTheme.weatherCurrentDto?.current.lastUpdated != null
        ? DateTime.parse(currentTheme.weatherCurrentDto!.current.lastUpdated)
        : DateTime.now();
    // Debugging line to check the weather code
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        title: const Text(
          AppString.weather,
          style: TextStyle(color: AppColor.black),
        ),
        actions: [const ButtonThemeWidget()],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.8,
            // Carrega o recurso de imagem local
            image: AssetImage(
              WeatherCondition.getWeatherImage(weatherCode, timestamp),
            ),
            // Ajusta a imagem para preencher a tela, preservando a proporção e cortando o excesso
            fit: BoxFit.cover,
          ),
        ),

        child: const Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(AppSize.size10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: AppSize.size0,
                      children: [SearchWidget(), CardCurrentWidget()],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: WeatherDataForecastWidgets()),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(weatherViewModelProvider.notifier).init();
    });
  }
}
