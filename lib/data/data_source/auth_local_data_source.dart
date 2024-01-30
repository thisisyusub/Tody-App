import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/core/exception/cache_exception.dart';

abstract interface class AuthLocalDataSource {
  Future<void> persistToken(String token);
  Future<String?> get token;
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl(this.secureStorage);

  final FlutterSecureStorage secureStorage;

  @override
  Future<void> persistToken(String token) async {
    try {
      await secureStorage.write(key: AppKeys.token, value: token);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        const CacheException('occured while writing token to cache'),
        stackTrace,
      );
    }
  }

  @override
  Future<String?> get token async {
    try {
      final token = await secureStorage.read(key: AppKeys.token);
      return token;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        const CacheException('occured while reading token from cache'),
        stackTrace,
      );
    }
  }
}
