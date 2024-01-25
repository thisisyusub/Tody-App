import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tody_app/core/rest/rest_client.dart';
import 'package:tody_app/model/error_response.dart';

final class HttpRestClient implements RestClient {
  const HttpRestClient(this.client);

  final http.Client client;

  @override
  Future<http.Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      final response = await client.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return response;
      } else if (response.statusCode >= 400 && response.statusCode <= 500) {
        final error = response.body;
        final errorResponse = ErrorResponse.fromJson(
          jsonDecode(error),
        );

        throw errorResponse;
      }

      throw Exception('Undefined exception!');
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<http.Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await client.get(url, headers: headers);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return response;
      } else if (response.statusCode >= 400 && response.statusCode <= 500) {
        final error = response.body;
        final errorResponse = ErrorResponse.fromJson(
          jsonDecode(error),
        );

        throw errorResponse;
      }

      throw Exception('Undefined exception!');
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
