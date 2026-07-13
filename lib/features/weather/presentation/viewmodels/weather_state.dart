import 'package:flutter/material.dart';

class WeatherState {
  final ThemeData appTheme;
  final int selectedTheme;
  final List<bool> isSelectedLst;
  WeatherState({
    required this.appTheme,
    required this.selectedTheme,
    required this.isSelectedLst,
  });
  WeatherState copyWith({
    ThemeData? appTheme,
    required int selectedTheme,
    required List<bool> isSelectedLst,
  }) {
    return WeatherState(
      appTheme: appTheme ?? this.appTheme,
      selectedTheme: selectedTheme,
      isSelectedLst: isSelectedLst,
    );
  }
}
