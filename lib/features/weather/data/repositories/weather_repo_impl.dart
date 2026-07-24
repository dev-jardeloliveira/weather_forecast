import 'package:weather_forecast/features/weather/data/datasources/weather_remote_impl.dart';
import 'package:weather_forecast/features/weather/data/models/weather_current_dto.dart';
import 'package:weather_forecast/features/weather/data/models/weather_forecast_dto.dart';

class WeatherRepoImpl {
  final WeatherRemoteImpl _weatherRemoteImpl;
  WeatherRepoImpl(this._weatherRemoteImpl);

  Future<WeatherCurrentDto?> getWeatherCurrentRepo({
    String? q,
    String? lang,
  }) async {
    try {
      late final WeatherCurrentDto? result;
      final response = await _weatherRemoteImpl.getWeatherCurrent(
        q: q,
        lang: lang,
      );
      if (response != null) {
        result = WeatherCurrentDto.fromResponse(response);
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<WeatherForecastDto?> getWeatherForecastRepo({
    String? q,
    int? days,
  }) async {
    try {
      late final WeatherForecastDto result;
      final response = await _weatherRemoteImpl.getWeatherForecast(
        q: q,
        days: days,
      );
      if (response != null) {
        result = WeatherForecastDto.fromResponse(response);
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
