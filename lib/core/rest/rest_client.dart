import 'dart:convert';

class ApiResponse {
  const ApiResponse({
    required this.statusCode,
    required this.data,
  });

  final int statusCode;
  final dynamic data;
}

typedef HeaderBuilder = Future<Map<String, dynamic>?> Function();

abstract class RestClient {
  const RestClient({
    required this.baseUrl,
    this.headers,
  });

  final String? baseUrl;
  final HeaderBuilder? headers;

  Future<ApiResponse> get(
    String url, {
    Map<String, String>? headers,
  });

  Future<ApiResponse> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
  });

  Uri buildUri(String path) {
    if (baseUrl != null) {
      return Uri.http(baseUrl!, path);
    }

    return Uri.parse(path);
  }

  dynamic decodeBody(String data) => jsonDecode(data);
}
