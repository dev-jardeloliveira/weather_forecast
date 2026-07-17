import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast/core/services/istorage_service.dart';
import 'package:weather_forecast/core/services/storage_services.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_vm.dart';

final GetIt getIt = GetIt.asNewInstance();
Future<void> setupDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<IStorageService>(
    () => StorageServices(sharedPreferences),
  );

  getIt.registerFactory<WeatherViewModel>(() => WeatherViewModel());
}
