import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast/core/network/dio_client.dart';
import 'package:weather_forecast/core/services/geolocation_service.dart';
import 'package:weather_forecast/core/services/igeolocation_service.dart';
import 'package:weather_forecast/core/services/ipermission_service.dart';
import 'package:weather_forecast/core/services/istorage_service.dart';
import 'package:weather_forecast/core/services/iweather_api_service.dart';
import 'package:weather_forecast/core/services/permission_service.dart';
import 'package:weather_forecast/core/services/storage_services.dart';
import 'package:weather_forecast/core/services/weather_api_service.dart';
import 'package:weather_forecast/features/weather/data/datasources/weather_remote_impl.dart';
import 'package:weather_forecast/features/weather/data/repositories/weather_repo_impl.dart';
import 'package:weather_forecast/features/weather/domain/usecase/get_current_weather_us.dart';
import 'package:weather_forecast/features/weather/domain/usecase/get_forecast_weather_us.dart';
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
  final weatherApiService = getIt<IWeatherApiService>();

  getIt.registerLazySingleton<WeatherRemoteImpl>(
    () => WeatherRemoteImpl(weatherApiService),
  );
  final weatherRemoteImpl = getIt<WeatherRemoteImpl>();
  getIt.registerLazySingleton<WeatherRepoImpl>(
    () => WeatherRepoImpl(weatherRemoteImpl),
  );
  final weatherRepoImpl = getIt<WeatherRepoImpl>();
  getIt.registerLazySingleton<GetCurrentWeatherUseCase>(
    () => GetCurrentWeatherUseCase(repository: weatherRepoImpl),
  );
  getIt.registerLazySingleton<GetForecastWeatherUserCase>(
    () => GetForecastWeatherUserCase(repository: weatherRepoImpl),
  );
  getIt.registerFactory<WeatherViewModel>(() => WeatherViewModel());
  getIt.registerLazySingleton<IPermissionService>(() => PermissionService());
  getIt.registerLazySingleton<IGeolocationService>(() => GeolocationService());
}
