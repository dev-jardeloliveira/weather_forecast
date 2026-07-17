import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/constants/app_theme.dart';
import 'package:weather_forecast/core/dependencies/setup_dependence.dart';
import 'package:weather_forecast/core/services/istorage_service.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_state.dart';

final storageServicesProvider = Provider<IStorageService>((ref) {
  return getIt<IStorageService>();
});

final weatherViewModelProvider =
    NotifierProvider<WeatherViewModel, WeatherState>(() => WeatherViewModel());

class WeatherViewModel extends Notifier<WeatherState> {
  IStorageService get _storageServices => ref.watch(storageServicesProvider);
  @override
  WeatherState build() {
    loadThemeMode();
    return WeatherState(
      appTheme: AppTheme.lightTheme,
      selectedTheme: 0,
      isSelectedLst: [true, false],
    );
  }

  Future<void> loadThemeMode() async {
    final themeMode = await _storageServices.get(key: 'themeMode');
    if (themeMode == null) {
      state = state.copyWith(
        appTheme: AppTheme.lightTheme,
        selectedTheme: 0,
        isSelectedLst: [true, false],
      );
    }
    state = state.copyWith(
      appTheme: themeMode == 0 ? AppTheme.lightTheme : AppTheme.darkTheme,
      selectedTheme: themeMode ?? 0,
      isSelectedLst: [themeMode == 0, themeMode == 1],
    );
  }

  void selectedTheme(int index) {
    if (state.selectedTheme == index) return;
    final islight = index == 0;
    state = state.copyWith(
      appTheme: islight ? AppTheme.lightTheme : AppTheme.darkTheme,
      selectedTheme: index,
      isSelectedLst: [islight, !islight],
    );
    _storageServices.set(key: 'themeMode', value: index);
  }

  void toggleTheme() {
    selectedTheme(state.selectedTheme == 0 ? 1 : 0);
  }
}
