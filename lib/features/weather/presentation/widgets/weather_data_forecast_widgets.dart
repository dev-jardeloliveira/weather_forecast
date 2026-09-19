import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/constants/app_color.dart';
import 'package:weather_forecast/features/weather/data/models/weather_forecast_dto.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_vm.dart';
import 'package:weather_forecast/features/weather/presentation/widgets/card_forecast_widget.dart';

class WeatherDataForecastWidgets extends ConsumerWidget {
  const WeatherDataForecastWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foreacast = ref.watch(weatherViewModelProvider);
    int? days = 0;
    List<ForecastDayDto> forecastDays = [];
    if (foreacast.weatherForecastDto != null) {
      days = foreacast.weatherForecastDto!.forecast.forecastday.length;
      forecastDays = foreacast.weatherForecastDto!.forecast.forecastday;
    }
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 0.2,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: AppColor.transparent,
          child: ListView.builder(
            controller: scrollController,
            itemCount: days ?? 0, // Número de itens na lista
            itemBuilder: (BuildContext context, int index) {
              return CardForecastWidget(forecastDto: forecastDays[index]);
            },
          ),
        );
      },
    );
  }
}
