import 'package:flutter/material.dart';
import 'package:weather_forecast/features/weather/data/models/weather_current_dto.dart';
import 'package:weather_forecast/features/weather/data/models/weather_forecast_dto.dart';

class WeatherState {
  final ThemeData appTheme;
  final int selectedTheme;
  final List<bool> isSelectedLst;
  WeatherCurrentDto? weatherCurrentDto;
  WeatherForecastDto? weatherForecastDto;
  WeatherState({
    required this.appTheme,
    required this.selectedTheme,
    required this.isSelectedLst,
    required this.weatherCurrentDto,
    required this.weatherForecastDto,
  });
  WeatherState copyWith({
    ThemeData? appTheme,
    required int selectedTheme,
    required List<bool> isSelectedLst,
    required WeatherCurrentDto weatherCurrentDto,
    required WeatherForecastDto? weatherForecastDto,
  }) {
    return WeatherState(
      appTheme: appTheme ?? this.appTheme,
      selectedTheme: selectedTheme,
      isSelectedLst: isSelectedLst,
      weatherCurrentDto: weatherCurrentDto,
      weatherForecastDto: weatherForecastDto ?? this.weatherForecastDto,
    );
  }
}
