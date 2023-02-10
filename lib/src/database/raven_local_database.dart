import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RavenLocalDatabase {
  ///write data to disk[putData]
  static Future<bool> putData(
      {required String key, required String value}) async {
    await _instance().write(key: key, value: value);
    return true;
  }

  ///get data to from disk[getData]
  static Future<String?> getData(String key) async {
    final data = await _instance().read(key: key);
    return data;
  }

  ///check if local db contains key[hasKey]
  static Future<bool> hasKey(String key) async {
    return _instance().containsKey(key: key);
  }

  ///delete a single data fromt the local database [deleteData]
  static Future<bool> deleteData(String key) async {
    await _instance().delete(key: key);
    return true;
  }

  ///drop the entire local database[clearStorage]
  static Future<bool> clearStorage() async {
    await _instance().deleteAll();
    return true;
  }

  /// persist the app token to local storage[setToken]
  static Future<bool> setToken(String token) async {
    await _instance().write(key: userTokenKey, value: token);
    return true;
  }

  ///persist the user pin into local storage[setPIN]
  static Future<bool> setPIN(String pin) async {
    await _instance().write(key: userPinKey, value: pin);
    return true;
  }

  /// get the user token[getToken]
  static Future<String> getToken() async {
    String? token = await _instance().read(key: userTokenKey);
    return token ?? '';
  }

  ///get user pin from local storage[getPIN]
  static Future<String> getPIN() async {
    String? pin = await _instance().read(key: userPinKey);
    return pin ?? '';
  }

  static FlutterSecureStorage? _storage;

  ///increate an initialize storage variable once[_instance]
  static FlutterSecureStorage _instance() {
    if (_storage == null) {
      const options =
          IOSOptions(accessibility: KeychainAccessibility.first_unlock);
      _storage = const FlutterSecureStorage(iOptions: options);
      return _storage!;
    }
    return _storage!;
  }

  static String userTokenKey = "user_token_key";
  static String userPinKey = "user_pin_key";
}
