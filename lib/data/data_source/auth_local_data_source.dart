import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/core/exception/cache_exception.dart';
import 'package:tody_app/core/utils/base64_converter.dart';

abstract interface class AuthLocalDataSource {
  Future<void> persistToken(String value);
  Future<String?> get token;
  Future<void> clearCredentials();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl({
    required this.secureStorage,
    required this.base64converter,
  });

  final FlutterSecureStorage secureStorage;
  final Base64Converter base64converter;

  @override
  Future<void> persistToken(String value) async {
    try {
      final token = base64converter.convert(value.codeUnits);
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

  @override
  Future<void> clearCredentials() async {
    try {
      await secureStorage.delete(key: AppKeys.token);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        const CacheException('occured while writing token to cache'),
        stackTrace,
      );
    }
  }
}
