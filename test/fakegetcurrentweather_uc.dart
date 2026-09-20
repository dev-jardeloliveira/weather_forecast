// test/fakes/fake_get_current_weather_us.dart
import 'package:weather_forecast/features/weather/data/models/weather_current_dto.dart';
import 'package:weather_forecast/features/weather/domain/usecase/get_current_weather_us.dart';

class FakeGetCurrentWeatherUseCase implements GetCurrentWeatherUseCase {
  @override
  Future<WeatherCurrentDto?> execute({String? q, String? lang}) async => null;
}
