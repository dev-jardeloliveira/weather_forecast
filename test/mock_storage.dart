import 'package:weather_forecast/core/services/istorage_service.dart';

class MockStorage implements IStorageService {
  final Map<String, int> _mock = {};
  final Map<String, String?> _mock2 = {};
  @override
  Future<int?> get({String? key}) async {
    if (key == null) {
      throw ArgumentError('Key null');
    }
    return _mock[key];
  }

  @override
  Future<String?> getString({String? key}) async {
    if (key == null) {
      throw ArgumentError('Key null');
    }
    return _mock2[key];
  }

  @override
  Future<void> set({String? key, int? value}) async {
    if (key == null || value == null) {
      throw ArgumentError('Key or value null');
    }
    _mock[key] = value;
  }

  @override
  Future<void> setString({String? key, String? value}) async {
    if (key == null || value == null) {
      throw ArgumentError('Key or value null');
    }
    _mock2[key] = value;
  }
}
