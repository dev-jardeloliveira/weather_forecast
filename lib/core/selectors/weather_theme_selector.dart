import 'package:flutter/material.dart';
import 'package:weather_forecast/core/extensions/weather_theme_extension.dart';

extension WeatherThemeSelector on BuildContext {
  WeatherThemeExtension get weatherTheme =>
      Theme.of(this).extension<WeatherThemeExtension>()!;
}
