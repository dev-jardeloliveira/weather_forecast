import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_forecast/core/constants/app_theme.dart';
import 'package:weather_forecast/core/dependencies/setup_dependence.dart';
import 'package:weather_forecast/core/services/igeolocation_service.dart';
import 'package:weather_forecast/core/services/ipermission_service.dart';
import 'package:weather_forecast/core/services/istorage_service.dart';
import 'package:weather_forecast/features/weather/data/models/weather_current_dto.dart';
import 'package:weather_forecast/features/weather/data/models/weather_forecast_dto.dart';
import 'package:weather_forecast/features/weather/domain/usecase/get_current_weather_us.dart';
import 'package:weather_forecast/features/weather/domain/usecase/get_forecast_weather_us.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_state.dart';

final geolocationServiceProvider = Provider<IGeolocationService>((ref) {
  return getIt<IGeolocationService>();
});
final getCurrentUserCaseProvider = Provider<GetCurrentWeatherUseCase>((ref) {
  return getIt<GetCurrentWeatherUseCase>();
});
final getForecastUserCaseProvider = Provider<GetForecastWeatherUserCase>((ref) {
  return getIt<GetForecastWeatherUserCase>();
});
final permissionServiceProvider = Provider<IPermissionService>((ref) {
  return getIt<IPermissionService>();
});
final storageServicesProvider = Provider<IStorageService>((ref) {
  return getIt<IStorageService>();
});

final weatherViewModelProvider =
    NotifierProvider<WeatherViewModel, WeatherState>(() => WeatherViewModel());

class WeatherViewModel extends Notifier<WeatherState> {
  var log = Logger(printer: PrettyPrinter(printEmojis: true));
  IGeolocationService get _geolocationService =>
      ref.watch(geolocationServiceProvider);
  GetCurrentWeatherUseCase get _getCurrentUS =>
      ref.watch(getCurrentUserCaseProvider);
  IPermissionService get _permissionService =>
      ref.watch(permissionServiceProvider);
  IStorageService get _storageServices => ref.watch(storageServicesProvider);
  @override
  WeatherState build() {
    checkPermission();
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
          condition: Condition(text: '', icon: '', code: 0),
        ),
        location: Location(country: '', name: '', region: '', localtime: ''),
      ),
      weatherForecastDto: WeatherForecastDto(
        forecast: ForecastDto(forecastday: []),
        current: CurrentForecast(
          lastUpdated: '',
          tempC: 0.0,
          tempF: 0.0,
          isDay: 0,
          humidity: 0,
          feelslikeC: 0.0,
          feelslikeF: 0.0,
          uv: 0.0,
        ),
        location: LocationForecast(
          country: '',
          name: '',
          region: '',
          localtime: '',
        ),
      ),
    );
  }

  Future<void> checkPermission() async {
    final isGranted = await _permissionService.checkPermission(
      permission: Permission.location,
    );
    if (!isGranted) {
      await _permissionService.requestPermission(
        permission: Permission.location,
      );
    } else {
      await getCurrentLocation();
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      final placemark = await _geolocationService.getCurrentLocation();
      final city = placemark?.locality ?? 'Brasilia';
      if (city.isEmpty) {
        throw Exception('City name is empty.');
      }
      await searchDataWeather(city: city, days: 14);
    } catch (e) {
      log.e('Error getting current location', error: e);
    }
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
            condition: Condition(text: '', icon: '', code: 0),
          ),
          location: Location(country: '', name: '', region: '', localtime: ''),
        ),
        weatherForecastDto: WeatherForecastDto(
          forecast: ForecastDto(forecastday: []),
          current: CurrentForecast(
            lastUpdated: '',
            tempC: 0.0,
            tempF: 0.0,
            isDay: 0,
            humidity: 0,
            feelslikeC: 0.0,
            feelslikeF: 0.0,
            uv: 0.0,
          ),
          location: LocationForecast(
            country: '',
            name: '',
            region: '',
            localtime: '',
          ),
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
          condition: Condition(text: '', icon: '', code: 0),
        ),
        location: Location(country: '', name: '', region: '', localtime: ''),
      ),
      weatherForecastDto: WeatherForecastDto(
        forecast: ForecastDto(forecastday: []),
        current: CurrentForecast(
          lastUpdated: '',
          tempC: 0.0,
          tempF: 0.0,
          isDay: 0,
          humidity: 0,
          feelslikeC: 0.0,
          feelslikeF: 0.0,
          uv: 0.0,
        ),
        location: LocationForecast(
          country: '',
          name: '',
          region: '',
          localtime: '',
        ),
      ),
    );
  }

  //Data
  Future<void> searchDataWeather({
    String? city,
    String? lang,
    int? days,
  }) async {
    final currentWeather = await _getCurrentUS.execute(q: city, lang: lang);
    final forecastWeather = await ref
        .watch(getForecastUserCaseProvider)
        .execute(q: city, days: days);
    if (currentWeather == null || forecastWeather == null) return;
    state = state.copyWith(
      selectedTheme: state.selectedTheme,
      isSelectedLst: state.isSelectedLst,
      weatherCurrentDto: currentWeather,
      weatherForecastDto: forecastWeather,
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
          condition: Condition(text: '', icon: '', code: 0),
        ),
        location: Location(country: '', name: '', region: '', localtime: ''),
      ),

      weatherForecastDto: WeatherForecastDto(
        forecast: ForecastDto(forecastday: []),
        current: CurrentForecast(
          lastUpdated: '',
          tempC: 0.0,
          tempF: 0.0,
          isDay: 0,
          humidity: 0,
          feelslikeC: 0.0,
          feelslikeF: 0.0,
          uv: 0.0,
        ),
        location: LocationForecast(
          country: '',
          name: '',
          region: '',
          localtime: '',
        ),
      ),
    );
    _storageServices.set(key: 'themeMode', value: index);
  }

  void toggleTheme() {
    selectedTheme(state.selectedTheme == 0 ? 1 : 0);
  }
}
