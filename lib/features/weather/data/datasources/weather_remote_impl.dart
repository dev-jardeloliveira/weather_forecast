import 'package:weather_forecast/core/services/iweather_api_service.dart';
import 'package:weather_forecast/core/services/models/current_response.dart';
import 'package:weather_forecast/core/services/models/forecast_response.dart';
import 'package:weather_forecast/features/weather/data/datasources/iweather_remote_impl.dart';

class WeatherRemoteImpl implements IWeatherRemoteImpl {
  final IWeatherApiService _weatherService;
  WeatherRemoteImpl(this._weatherService);

  @override
  Future<CurrentResponse> getWeatherCurrent({String? q, String? lang}) async {
    return await _weatherService.current(q: q, lang: lang);
  }

  @override
  Future<ForecastResponse> getWeatherForecast({String? q, int? days}) async {
    return await _weatherService.forecast(q: q, days: days);
  }
}
