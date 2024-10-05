import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:quotes_shop/locator.dart';



class StorageService {

  final FlutterSecureStorage _storage = const FlutterSecureStorage();


  Future<void> storeString(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      print('Error storing string: $e');
    }
  }

  Future<String?> getString(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      print('Error retrieving string: $e');
      return null;
    }
  }

  Future<void> deleteString(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      print('Error deleting string: $e');
    }
  }

  Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      print('Error clearing all: $e');
    }
  }
}
void initStorage(){
  locator.registerLazySingleton(()=>StorageService());
}