import 'package:weather_forecast/core/exceptions/validation_exception.dart';
import 'package:weather_forecast/features/weather/data/models/weather_current_dto.dart';
import 'package:weather_forecast/features/weather/data/repositories/weather_repo_impl.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepoImpl _repository;
  GetCurrentWeatherUseCase({required this._repository});

  Future<WeatherCurrentDto?> execute({String? q, String? lang}) async {
    if (!_isValidCityAndLang(q, lang)) {
      ValidationException(message: 'Nome da cidade ou idioma nulo ou vazio');
    }

    try {
      return await _repository.getWeatherCurrentRepo(q: q, lang: lang);
    } catch (e) {
      ValidationException(message: 'Erro no caso de uso current: $e');
      rethrow;
    }
  }

  bool _isValidCityAndLang(String? q, String? lang) {
    return (q != null || q!.isNotEmpty || lang != null || lang!.isNotEmpty);
  }
}
