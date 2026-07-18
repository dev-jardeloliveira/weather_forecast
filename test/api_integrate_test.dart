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
  });
}
