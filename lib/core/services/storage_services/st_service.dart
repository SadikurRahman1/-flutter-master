
import '../../exported_files/exported_file.dart';

class STService {
  static final STService _instance = STService._internal();

  factory STService() => _instance;

  STService._internal();

  final GetStorage _storage = GetStorage();

  Future<void> saveData(String key, String value) async {
    await _storage.write(key, value);
  }

  String? getData(String key) {
    return _storage.read<String>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}