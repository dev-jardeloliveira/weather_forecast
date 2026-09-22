import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/constants/app_color.dart';
import 'package:weather_forecast/core/constants/app_size.dart';
import 'package:weather_forecast/core/constants/app_string.dart';
import 'package:weather_forecast/features/weather/presentation/widgets/button_theme_widget.dart';
import 'package:weather_forecast/features/weather/presentation/widgets/card_current_widget.dart';
import 'package:weather_forecast/features/weather/presentation/widgets/image_background_widget.dart';
import 'package:weather_forecast/features/weather/presentation/widgets/search_widget.dart';
import 'package:weather_forecast/features/weather/presentation/widgets/weather_data_forecast_widgets.dart';

class WeatherView extends ConsumerWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColor.transparent,
        title: const Text(
          AppString.weather,
          style: TextStyle(color: AppColor.black),
        ),
        actions: [const RepaintBoundary(child: ButtonThemeWidget())],
      ),
      body: const RepaintBoundary(
        child: ImageBackgroundWidget(
          child: Column(
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
      ),
    );
  }
}
