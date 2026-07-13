import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storageServicesProvider = Provider<StorageServices>((ref) {
  return StorageServices();
});

class StorageServices {
  final Future<SharedPreferencesWithCache> _prefs =
      SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: <String>{'themeMode'},
        ),
      );

  Future<int?> get({String? key}) async {
    if (key == null) {
      throw ArgumentError('Key cannot be null');
    }
    final SharedPreferencesWithCache prefs = await _prefs;
    return prefs.getInt(key);
  }

  Future<void> set({String? key, int? value}) async {
    if (key == null || value == null) {
      throw ArgumentError('Key and value cannot be null');
    }
    final SharedPreferencesWithCache prefs = await _prefs;
    await prefs.setInt(key, value);
  }
}
