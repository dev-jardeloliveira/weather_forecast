import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast/core/services/istorage_service.dart';

class StorageServices implements IStorageService {
  // final Future<SharedPreferencesWithCache> _prefs =
  //     SharedPreferencesWithCache.create(
  //       cacheOptions: const SharedPreferencesWithCacheOptions(
  //         allowList: <String>{'themeMode'},
  //       ),
  //     );
  final SharedPreferences _prefs;
  StorageServices(this._prefs);
  @override
  Future<int?> get({String? key}) async {
    if (key == null) {
      throw ArgumentError('Key cannot be null');
    }
    final SharedPreferences prefs = _prefs;
    return prefs.getInt(key);
  }

  @override
  Future<void> set({String? key, int? value}) async {
    if (key == null || value == null) {
      throw ArgumentError('Key and value cannot be null');
    }
    final SharedPreferences prefs = _prefs;
    await prefs.setInt(key, value);
  }
}
