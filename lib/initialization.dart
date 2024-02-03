import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tody_app/bloc/auth/auth_notifier.dart';
import 'package:tody_app/bloc/login/login_notifier.dart';
import 'package:tody_app/bloc/settings/localization/localization_notifier.dart';
import 'package:tody_app/core/rest/http_rest_client.dart';
import 'package:tody_app/core/rest/rest_client.dart';
import 'package:tody_app/core/utils/base64_converter.dart';
import 'package:tody_app/data/data_source/auth_local_data_source.dart';
import 'package:tody_app/data/data_source/auth_remote_data_source.dart';
import 'package:tody_app/data/repository/auth_repository.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /// externals
  getIt.registerSingleton<http.Client>(http.Client());
  getIt.registerFactory<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
    instanceName: 'secureStorage',
  );

  final preferences = await SharedPreferences.getInstance();
  getIt.registerSingleton(preferences);

  /// rest client
  getIt.registerSingleton<RestClient>(HttpRestClient(getIt()));

  /// helpers
  getIt.registerFactory<Base64Converter>(
    () => Base64ConverterImpl(),
  );

  /// data sources
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      secureStorage: getIt(instanceName: 'secureStorage'),
      base64converter: getIt(),
    ),
  );

  getIt.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceImpl(getIt()),
  );

  /// repositories
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      authLocalDataSource: getIt(),
      authRemoteDataSource: getIt(),
    ),
  );

  /// bloc, state management, notifier, viewmodel
  getIt.registerFactory(() => LoginNotifier(getIt()));
  getIt.registerFactory(() => AuthNotifier(getIt()));
  getIt.registerFactory(() => LocalizationNotifier(getIt()));
}
