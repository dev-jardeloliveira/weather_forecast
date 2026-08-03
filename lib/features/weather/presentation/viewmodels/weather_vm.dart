import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/constants/app_theme.dart';
import 'package:weather_forecast/core/dependencies/setup_dependence.dart';
import 'package:weather_forecast/core/services/istorage_service.dart';
import 'package:weather_forecast/features/weather/data/models/weather_current_dto.dart';
import 'package:weather_forecast/features/weather/domain/usecase/get_current_weather_us.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_state.dart';

final getCurrentUserCaseProvider = Provider<GetCurrentWeatherUseCase>((ref) {
  return getIt<GetCurrentWeatherUseCase>();
});
final storageServicesProvider = Provider<IStorageService>((ref) {
  return getIt<IStorageService>();
});

final weatherViewModelProvider =
    NotifierProvider<WeatherViewModel, WeatherState>(() => WeatherViewModel());

class WeatherViewModel extends Notifier<WeatherState> {
  GetCurrentWeatherUseCase get _getCurrentUS =>
      ref.watch(getCurrentUserCaseProvider);
  IStorageService get _storageServices => ref.watch(storageServicesProvider);
  @override
  WeatherState build() {
    loadThemeMode();
    return WeatherState(
      appTheme: AppTheme.lightTheme,
      selectedTheme: 0,
      isSelectedLst: [true, false],
      weatherCurrentDto: WeatherCurrentDto(
        current: Current(
          lastUpdated: DateTime.now().toString(),
          tempC: 0.0,
          tempF: 0.0,
          isDay: 0,
          humidity: 0,
          feelslikeC: 0.0,
          feelslikeF: 0.0,
          uv: 0.0,
        ),
        location: Location(country: '', name: '', region: '', localtime: ''),
      ),
    );
  }

  // Theme
  Future<void> loadThemeMode() async {
    final themeMode = await _storageServices.get(key: 'themeMode');
    if (themeMode == null) {
      state = state.copyWith(
        appTheme: AppTheme.lightTheme,
        selectedTheme: 0,
        isSelectedLst: [true, false],
        weatherCurrentDto: WeatherCurrentDto(
          current: Current(
            lastUpdated: DateTime.now().toString(),
            tempC: 0.0,
            tempF: 0.0,
            isDay: 0,
            humidity: 0,
            feelslikeC: 0.0,
            feelslikeF: 0.0,
            uv: 0.0,
          ),
          location: Location(country: '', name: '', region: '', localtime: ''),
        ),
      );
    }
    state = state.copyWith(
      appTheme: themeMode == 0 ? AppTheme.lightTheme : AppTheme.darkTheme,
      selectedTheme: themeMode ?? 0,
      isSelectedLst: [themeMode == 0, themeMode == 1],
      weatherCurrentDto: WeatherCurrentDto(
        current: Current(
          lastUpdated: DateTime.now().toString(),
          tempC: 0.0,
          tempF: 0.0,
          isDay: 0,
          humidity: 0,
          feelslikeC: 0.0,
          feelslikeF: 0.0,
          uv: 0.0,
        ),
        location: Location(country: '', name: '', region: '', localtime: ''),
      ),
    );
  }

  //Data
  Future<void> searchDataWeather({String? city, String? lang}) async {
    final currentWeather = await _getCurrentUS.execute(q: city, lang: lang);
    if (currentWeather == null) return;
    state = state.copyWith(
      selectedTheme: state.selectedTheme,
      isSelectedLst: state.isSelectedLst,
      weatherCurrentDto: currentWeather,
    );
  }

  void selectedTheme(int index) {
    if (state.selectedTheme == index) return;
    final islight = index == 0;
    state = state.copyWith(
      appTheme: islight ? AppTheme.lightTheme : AppTheme.darkTheme,
      selectedTheme: index,
      isSelectedLst: [islight, !islight],
      weatherCurrentDto: WeatherCurrentDto(
        current: Current(
          lastUpdated: DateTime.now().toString(),
          tempC: 0.0,
          tempF: 0.0,
          isDay: 0,
          humidity: 0,
          feelslikeC: 0.0,
          feelslikeF: 0.0,
          uv: 0.0,
        ),
        location: Location(country: '', name: '', region: '', localtime: ''),
      ),
    );
    _storageServices.set(key: 'themeMode', value: index);
  }

  void toggleTheme() {
    selectedTheme(state.selectedTheme == 0 ? 1 : 0);
  }
}
