import 'dart:convert';

import 'package:tody_app/core/rest/rest_client.dart';
import 'package:tody_app/data/model/auth_request_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<void> login(String username, String password);
  Future<void> register(String username, String password, String fullName);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this.client);

  final RestClient client;

  @override
  Future<void> login(String username, String password) async {
    try {
      await client.post(
        '/auth/login',
        body: jsonEncode(
          AuthRequestModel(
            username: username,
            password: password,
          ).toJson(),
        ),
      );
    } on Object {
      rethrow;
    }
  }

  @override
  Future<void> register(
    String username,
    String password,
    String fullName,
  ) async {
    try {
      await client.post(
        '/auth/register',
        body: RegisterRequestModel(
          username: username,
          password: password,
          fullName: fullName,
        ).toJson(),
      );
    } on Object {
      rethrow;
    }
  }
}
