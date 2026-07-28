import 'package:weather_forecast/core/exceptions/validation_exception.dart';
import 'package:weather_forecast/features/weather/data/models/weather_forecast_dto.dart';
import 'package:weather_forecast/features/weather/data/repositories/weather_repo_impl.dart';

class GetForecastWeatherUserCase {
  final WeatherRepoImpl _repository;
  GetForecastWeatherUserCase({required this._repository});

  Future<WeatherForecastDto?> execute({String? q, int? days}) async {
    if (!_isValidCityAndDays(q, days)) {
      ValidationException(message: 'Nome da cidade ou dias null e ou vazios.');
    }
    return await _repository.getWeatherForecastRepo(q: q, days: days);
  }

  bool _isValidCityAndDays(String? q, int? days) {
    return (q != null || q!.isNotEmpty || days != null || days! > 0);
  }
}
