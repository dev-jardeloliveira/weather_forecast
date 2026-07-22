import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast/core/network/dio_client.dart';
import 'package:weather_forecast/core/services/istorage_service.dart';
import 'package:weather_forecast/core/services/iweather_api_service.dart';
import 'package:weather_forecast/core/services/storage_services.dart';
import 'package:weather_forecast/core/services/weather_api_service.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_vm.dart';

final GetIt getIt = GetIt.asNewInstance();
Future<void> setupDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<IStorageService>(
    () => StorageServices(sharedPreferences),
  );

  getIt.registerLazySingleton<Dio>(() => DioClient.getInstance());
  final dioClient = DioClient.getInstance();
  getIt.registerLazySingleton<IWeatherApiService>(
    () => WeatherApiService(dioClient),
  );

  getIt.registerFactory<WeatherViewModel>(() => WeatherViewModel());
}
