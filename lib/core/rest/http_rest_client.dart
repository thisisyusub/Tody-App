import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tody_app/core/rest/rest_client.dart';
import 'package:tody_app/data/model/error_response.dart';

enum _HttpRequestType { get, post, delete, patch, put }

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
  }) =>
      _handleRequest(
        url,
        requestType: _HttpRequestType.post,
        headers: headers,
        body: body,
      );

  @override
  Future<ApiResponse> get(
    String url, {
    Map<String, String>? headers,
  }) =>
      _handleRequest(
        url,
        requestType: _HttpRequestType.get,
        headers: headers,
      );

  @override
  Future<ApiResponse> delete(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) =>
      _handleRequest(
        url,
        requestType: _HttpRequestType.delete,
        headers: headers,
      );

  Future<ApiResponse> _handleRequest(
    String url, {
    required _HttpRequestType requestType,
    required Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      final generalHeaders = await super.headers?.call();

      late final http.Response response;

      switch (requestType) {
        case _HttpRequestType.get:
          response = await client.get(
            buildUri(url),
            headers: {
              if (generalHeaders != null) ...generalHeaders,
              if (headers != null) ...headers,
            },
          );

        case _HttpRequestType.post:
          response = await client.post(
            buildUri(url),
            headers: {
              if (generalHeaders != null) ...generalHeaders,
              if (headers != null) ...headers,
            },
            body: body,
          );
        case _HttpRequestType.delete:
          response = await client.delete(
            buildUri(url),
            headers: {
              if (generalHeaders != null) ...generalHeaders,
              if (headers != null) ...headers,
            },
            body: body,
          );
        case _HttpRequestType.patch:
          response = await client.patch(
            buildUri(url),
            headers: {
              if (generalHeaders != null) ...generalHeaders,
              if (headers != null) ...headers,
            },
            body: body,
          );
        case _HttpRequestType.put:
          response = await client.put(
            buildUri(url),
            headers: {
              if (generalHeaders != null) ...generalHeaders,
              if (headers != null) ...headers,
            },
            body: body,
          );
        default:
          throw UnimplementedError();
      }

      return _handleResponse(response);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  ApiResponse _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      if (response.body.isEmpty) {
        return ApiResponse(
          statusCode: response.statusCode,
        );
      }

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
