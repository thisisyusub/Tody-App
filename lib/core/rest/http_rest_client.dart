import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tody_app/core/rest/rest_client.dart';
import 'package:tody_app/data/model/error_response.dart';

final class HttpRestClient extends RestClient {
  const HttpRestClient({
    required this.client,
    super.baseUrl,
    super.headers,
  });

  final http.Client client;

  @override
  Future<ApiResponse> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      final generalHeaders = await super.headers?.call();

      final response = await client.post(
        buildUri(url),
        headers: {
          if (generalHeaders != null) ...generalHeaders,
          if (headers != null) ...headers,
        },
        body: body,
      );

      return _handleResponse(response);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<ApiResponse> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    try {
      final generalHeaders = await super.headers?.call();

      final response = await client.get(
        buildUri(url),
        headers: {
          if (generalHeaders != null) ...generalHeaders,
          if (headers != null) ...headers,
        },
      );

      return _handleResponse(response);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  ApiResponse _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final decodedBody = decodeBody(response.body) as Map<String, dynamic>;
      return ApiResponse(
        statusCode: decodedBody['statusCode'],
        data: decodedBody['data'],
      );
    } else if (response.statusCode >= 400 && response.statusCode <= 500) {
      final error = response.body;
      final errorResponse = ErrorResponse.fromJson(
        jsonDecode(error),
      );

      throw errorResponse;
    }

    throw Exception('Undefined exception!');
  }
}
