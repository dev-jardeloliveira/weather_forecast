abstract class IStorageService {
  Future<int?> get({String? key});
  Future<void> set({String? key, int? value});
}
