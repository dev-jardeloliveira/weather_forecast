import 'package:flutter/material.dart';
import 'package:weather_forecast/core/enums/weather_enum.dart';

class WeatherThemeExtension extends ThemeExtension<WeatherThemeExtension> {
  final LinearGradient? backgroundGradient;
  final Color? cardColor;
  final Color? detalheIconColor;

  WeatherThemeExtension({
    required this.backgroundGradient,
    required this.cardColor,
    required this.detalheIconColor,
  });

  @override
  ThemeExtension<WeatherThemeExtension> copyWith({
    LinearGradient? backgroundGradient,
    Color? cardColor,
    Color? detalheIconColor,
    WeatherTypeEnum? weatherType,
  }) {
    return WeatherThemeExtension(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      cardColor: cardColor ?? this.cardColor,
      detalheIconColor: detalheIconColor ?? this.detalheIconColor,
    );
  }

  @override
  ThemeExtension<WeatherThemeExtension> lerp(
    covariant ThemeExtension<WeatherThemeExtension>? other,
    double t,
  ) {
    if (other is! WeatherThemeExtension) {
      return this;
    }
    return WeatherThemeExtension(
      backgroundGradient: LinearGradient.lerp(
        backgroundGradient,
        other.backgroundGradient,
        t,
      ),
      cardColor: Color.lerp(cardColor, other.cardColor, t),
      detalheIconColor: Color.lerp(detalheIconColor, other.detalheIconColor, t),
    );
  }
}
