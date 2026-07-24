import 'package:weather_forecast/core/services/iweather_api_service.dart';
import 'package:weather_forecast/core/services/models/current_response.dart';
import 'package:weather_forecast/core/services/models/forecast_response.dart';

class WeatherRemoteImpl {
  final IWeatherApiService _weatherService;
  WeatherRemoteImpl(this._weatherService);

  Future<CurrentResponse?> getWeatherCurrent({String? q, String? lang}) async {
    return await _weatherService.current(q: q, lang: lang);
  }

  Future<ForecastResponse?> getWeatherForecast({String? q, int? days}) async {
    return await _weatherService.forecast(q: q, days: days);
  }
}
