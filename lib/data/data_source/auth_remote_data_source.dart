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
      final uri = Uri.http('192.168.100.5:8080', '/auth/login');

      await client.post(
        uri,
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
      final uri = Uri.http('192.168.100.5:8080', '/auth/register');

      await client.post(
        uri,
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
