import 'package:weather_forecast/core/services/models/current_response.dart';
import 'package:weather_forecast/core/services/models/forecast_response.dart';

abstract class IWeatherRemoteImpl {
  Future<CurrentResponse> getWeatherCurrent({String? q, String? lang});
  Future<ForecastResponse> getWeatherForecast({String? q, int? days});
}
