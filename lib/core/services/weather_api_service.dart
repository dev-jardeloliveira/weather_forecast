import 'package:dio/dio.dart';
import 'package:weather_forecast/core/constants/app_endpoint.dart';
import 'package:weather_forecast/core/services/iweather_api_service.dart';
import 'package:weather_forecast/core/services/models/current_response.dart';
import 'package:weather_forecast/core/services/models/forecast_response.dart';

class WeatherApiService implements IWeatherApiService {
  final Dio _dio;
  WeatherApiService(this._dio);
  @override
  Future<CurrentResponse?> current({String? q, String? lang}) async {
    try {
      final responseJson = await _dio.get(
        AppEndpoint.current,
        queryParameters: {'q': q, 'lang': lang},
      );
      if (responseJson.statusCode == 200) {
        final result = CurrentResponse.fromJson(responseJson.data);
        return result;
      }
      return null;
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Erro ao buscar o clima atual');
    } catch (e) {
      throw Exception('Erro ao processar os dados, erro: $e');
    }
  }

  @override
  Future<ForecastResponse?> forecast({String? q, int? days}) async {
    try {
      final responseJson = await _dio.get(
        AppEndpoint.forecast,
        queryParameters: {'q': q, 'days': days},
      );
      if (responseJson.statusCode == 200) {
        final result = ForecastResponse.fromJson(responseJson.data);
        return result;
      }
      return null;
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Erro ao buscar a previsão do tempo');
    } catch (e) {
      throw Exception('Erro ao processar os dados, erro: $e');
    }
  }
}
