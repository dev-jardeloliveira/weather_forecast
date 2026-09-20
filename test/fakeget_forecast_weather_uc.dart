// test/fakes/fake_get_forecast_weather_us.dart
import 'package:weather_forecast/features/weather/data/models/weather_forecast_dto.dart';
import 'package:weather_forecast/features/weather/domain/usecase/get_forecast_weather_us.dart';

class FakeGetForecastWeatherUseCase implements GetForecastWeatherUserCase {
  @override
  Future<WeatherForecastDto?> execute({String? q, int? days}) async => null;
}
