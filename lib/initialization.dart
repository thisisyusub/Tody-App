import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tody_app/bloc/auth/auth_notifier.dart';
import 'package:tody_app/bloc/login/login_notifier.dart';
import 'package:tody_app/bloc/settings/localization/localization_notifier.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/core/rest/http_rest_client.dart';
import 'package:tody_app/core/rest/rest_client.dart';
import 'package:tody_app/core/utils/base64_converter.dart';
import 'package:tody_app/data/data_source/auth_local_data_source.dart';
import 'package:tody_app/data/data_source/auth_remote_data_source.dart';
import 'package:tody_app/data/repository/auth_repository.dart';
import 'package:tody_app/features/category/data/data_source/category_remote_data_source.dart';
import 'package:tody_app/features/category/data/repository/category_repository_impl.dart';
import 'package:tody_app/features/category/domain/repository/category_repository.dart';
import 'package:tody_app/features/category/presentation/bloc/category_actions/category_actions_bloc.dart';
import 'package:tody_app/features/category/presentation/bloc/category_creation/list_creation_bloc.dart';
import 'package:tody_app/features/category/presentation/bloc/category_list/category_list_bloc.dart';

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
  getIt.registerSingleton<RestClient>(
    HttpRestClient(
      client: getIt(),
      baseUrl: 'localhost:8080',
      headers: () async {
        final secureStorage = getIt<FlutterSecureStorage>(
          instanceName: 'secureStorage',
        );
        final token = await secureStorage.read(key: AppKeys.token);

        return {
          'Authorization': 'Basic $token',
        };
      },
    ),
  );

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

  getIt.registerSingleton<CategoryRemoteDataSoure>(
    CategoryRemoteDataSoureImpl(client: getIt()),
  );

  /// repositories
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      authLocalDataSource: getIt(),
      authRemoteDataSource: getIt(),
    ),
  );

  getIt.registerSingleton<CategoryRepository>(
    CategoryRepositoryImpl(
      categoryRemoteDataSoure: getIt(),
    ),
  );

  /// bloc, state management, notifier, viewmodel
  getIt.registerFactory(() => LoginNotifier(getIt()));
  getIt.registerFactory(() => AuthNotifier(getIt()));
  getIt.registerFactory(() => LocalizationNotifier(getIt()));
  getIt.registerFactory(() => CategoryListBloc(categoryRepository: getIt()));
  getIt.registerFactory(() => CategoryCreationBloc(getIt()));
  getIt.registerFactory(() => CategoryActionsBloc(categoryRepository: getIt()));
}
