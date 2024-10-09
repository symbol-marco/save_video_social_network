import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

abstract class SVStoreService {
  static SharedPreferences? _sharedPreferences;

  static SharedPreferences get sharedPreferences => _sharedPreferences!;

  static Future<void> initialize() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static bool get doneGettingStarted =>
      _sharedPreferences?.getBool('doneGettingStarted') ?? false;

  static Future<void> setDoneGettingStarted(bool value) async =>
      await sharedPreferences.setBool('doneGettingStarted', value);

  static bool get askedForBatteryOptimization =>
      _sharedPreferences?.getBool('askedForBatteryOptimization') ?? false;

  static String get encryptionKey {
    final value = sharedPreferences.getString('encryption');
    final key = const Uuid().v4();
    if (value == null) {
      setEncrytionKey(key);
      return key;
    }
    return value;
  }

  static Future<void> setEncrytionKey(String key) async =>
      await sharedPreferences.setString('encryption', key);
}
