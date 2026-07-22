import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/core/constants/app_endpoint.dart';
import 'package:weather_forecast/core/network/dio_client.dart';
import 'package:weather_forecast/core/services/weather_api_service.dart';

void main() {
  late Dio dio;
  WeatherApiService? serviceWeather;
  setUp(() async {
    await dotenv.load();
    dio = DioClient.getInstance();
    //await setupDependencies();
    serviceWeather = WeatherApiService(dio);
  });

  group('Test integration', () {
    test('Deve fazer um Get com Sucesso', () async {
      final response = await dio.get(
        AppEndpoint.current,
        queryParameters: {'q': 'Ponte Nova'},
      );
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
    });

    test('Deve executar get com sucesso', () async {
      final response = await dio.get(
        AppEndpoint.forecast,
        queryParameters: {'q': 'Ponte Nova', 'days': '14'},
      );
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
    });
    test('Deve lançar exception', () async {
      try {
        final invalidDio = await _createInvalidKey();

        final response = await invalidDio.get(
          AppEndpoint.current,
          queryParameters: {'q': 'Ponte Nova'},
        );
        fail('Deveria falhar $response');
      } on DioException catch (e) {
        expect(e, isA<DioException>());
        expect(e.response?.statusCode, 401);
      }
    });
  });

  group('Test service integration', () {
    test('Deve fazer um get current com sucesso', () async {
      final result = await serviceWeather?.current(
        q: 'Ponte Nova',
        lang: 'pt-br',
      );
      expect(result?.current, isNotNull);
      expect(result?.location.name, equals('Ponte Nova'));
    });

    test('Deve fazer um get forecast com sucesso', () async {
      final result = await serviceWeather?.forecast(q: 'Ponte Nova', days: 14);
      expect(result?.current, isNotNull);
      expect(result?.location.name, equals('Ponte Nova'));
    });
  });
}

Future<Dio> _createInvalidKey() async {
  final key = dotenv.env['WEATHER_API_KEY'];
  dotenv.env['WEATHER_API_KEY'] = 'invalid_key';
  final dio = DioClient.getInstance();
  if (key != null) {
    dotenv.env['WEATHER_API_KEY'] = key;
  }
  return dio;
}
