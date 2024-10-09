import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:save_video_social_network/src/services/sv_store/sv_store.dart';
import 'package:save_video_social_network/src/utils/platform.dart';
import 'package:uuid/uuid.dart';

abstract class EncryptedSVStoreService {
  static const _storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  static FlutterSecureStorage get storage => _storage;

  static String? _encryptionKeySync;

  static String get encryptionKeySync => _encryptionKeySync!;
  static Future<void> initialize() async {
    _encryptionKeySync = await encryptionKey;
  }

  static bool get isUnsupportedPlatform => kIsIOS || kIsDesktop;

  static Future<String> get encryptionKey async {
    if (isUnsupportedPlatform) {
      return SVStoreService.encryptionKey;
    }
    try {
      final value = await _storage.read(key: 'encrytion');
      final key = const Uuid().v4();

      if (value == null) {
        await setEncrytionKey(key);
        return key;
      }
      return value;
    } catch (_) {
      return SVStoreService.encryptionKey;
    }
  }

  static Future<void> setEncrytionKey(String key) async {
    if (isUnsupportedPlatform) {
      await SVStoreService.setEncrytionKey(key);
      return;
    }
    try {
      await _storage.write(key: key, value: key);
    } catch (_) {
      await SVStoreService.setEncrytionKey(key);
    } finally {
      _encryptionKeySync = key;
    }
  }
}
