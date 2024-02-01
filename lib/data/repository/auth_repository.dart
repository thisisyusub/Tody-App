import 'package:tody_app/core/exception/cache_exception.dart';
import 'package:tody_app/core/exception/general_exception.dart';
import 'package:tody_app/data/data_source/auth_local_data_source.dart';
import 'package:tody_app/data/data_source/auth_remote_data_source.dart';
import 'package:tody_app/data/model/error_response.dart';

abstract interface class AuthRepository {
  Future<void> login(String username, String password);
  Future<void> register(String username, String password, String fullName);
  Future<bool> get isAuthenticated;
  Future<void> logOut();
}

final class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.authLocalDataSource,
    required this.authRemoteDataSource,
  });

  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<void> login(String username, String password) async {
    try {
      await authRemoteDataSource.login(username, password);
      await authLocalDataSource.persistToken('$username:$password');
    } on ErrorResponse {
      rethrow;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        const GeneralException('Something wen\'t wrong!'),
        stackTrace,
      );
    }
  }

  @override
  Future<void> register(
      String username, String password, String fullName) async {
    try {
      await authRemoteDataSource.register(
        username,
        password,
        fullName,
      );
      await authLocalDataSource.persistToken(
        '$username:$password',
      );
    } on ErrorResponse {
      rethrow;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        const GeneralException('Something wen\'t wrong!'),
        stackTrace,
      );
    }
  }

  @override
  Future<bool> get isAuthenticated async {
    try {
      final token = await authLocalDataSource.token;
      return token != null;
    } on CacheException catch (e, stackTrace) {
      Error.throwWithStackTrace(
        const GeneralException(
          'error while reading auth '
          'state from cache',
        ),
        stackTrace,
      );
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await authLocalDataSource.clearCredentials();
    } on CacheException catch (e, stackTrace) {
      Error.throwWithStackTrace(
        const GeneralException(
          'error while reading auth '
          'state from cache',
        ),
        stackTrace,
      );
    }
  }
}
