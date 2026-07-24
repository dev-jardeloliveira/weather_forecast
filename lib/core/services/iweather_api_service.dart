import 'package:weather_forecast/core/services/models/current_response.dart';
import 'package:weather_forecast/core/services/models/forecast_response.dart';

abstract class IWeatherApiService {
  Future<CurrentResponse?> current({String? q, String? lang});
  Future<ForecastResponse?> forecast({String? q, int? days});
}
