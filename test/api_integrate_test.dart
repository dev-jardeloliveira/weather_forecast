import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/core/constants/app_endpoint.dart';
import 'package:weather_forecast/core/network/dio_client.dart';

void main() {
  late Dio dio;
  setUp(() async {
    await dotenv.load();
    dio = DioClient.getInstance();
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

    test('Deve lançar exception', () async {
      try {
        final invalidDio = await _createInvalidKey();

        final response = await invalidDio.get(
          AppEndpoint.current,
          queryParameters: {'q': 'Ponte Nova'},
        );
        print(response);
        fail('Deveria falhar');
      } on DioException catch (e) {
        expect(e, isA<DioException>());
        expect(e.response?.statusCode, 401);
      }
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
