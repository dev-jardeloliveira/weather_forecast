import 'package:dio/dio.dart';
import 'package:weather_forecast/core/constants/app_endpoint.dart';
import 'package:weather_forecast/core/services/iweather_api_service.dart';
import 'package:weather_forecast/core/services/models/current_response.dart';
import 'package:weather_forecast/core/services/models/forecast_response.dart';

class WeatherApiService implements IWeatherApiService {
  final Dio _dio;
  WeatherApiService(this._dio);
  @override
  Future<CurrentResponse> current({String? q, String? lang}) async {
    final responseJson = await _dio.get(
      AppEndpoint.current,
      queryParameters: {'q': q, 'lang': lang},
    );
    final result = CurrentResponse.fromJson(responseJson.data);
    return result;
  }

  @override
  Future<ForecastResponse> forecast({String? q, int? days}) async {
    final responseJson = await _dio.get(
      AppEndpoint.forecast,
      queryParameters: {'q': q, 'days': days},
    );
    final result = ForecastResponse.fromJson(responseJson.data);
    return result;
  }
}
