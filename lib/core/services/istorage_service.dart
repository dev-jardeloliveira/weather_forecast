abstract class IStorageService {
  Future<int?> get({String? key});
  Future<String?> getString({String? key});
  Future<void> set({String? key, int? value});
  Future<void> setString({String? key, String? value});
}
