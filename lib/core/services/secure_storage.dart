import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final String token = "token";
  final String userName = "name";

  Future<void> _write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> _read(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<bool> containsKey(String key) async {
    final value = await _secureStorage.read(key: key);
    return value != null;
  }

  Future<void> addUserToken(String value) async {
    return await _write(token, value);
  }

  Future<String?> getUserToken() async {
    return await _read(token);
  }

  Future<void> addUserName(String value) async {
    return await _write(userName, value);
  }

  Future<String?> getUserName() async {
    return await _read(userName);
  }

  Future<bool> containsTokenKey() async {
    final value = await _secureStorage.read(key: token);
    return value != null;
  }

  Future<void> deleteUserToken() async {
    await _secureStorage.delete(key: token);
  }

  Future<void> deleteUserName() async {
    await _secureStorage.delete(key: userName);
  }
}
