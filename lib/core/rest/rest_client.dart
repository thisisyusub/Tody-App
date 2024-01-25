import 'package:http/http.dart' as http;

abstract class RestClient {
  Future<http.Response> get(
    Uri url, {
    Map<String, String>? headers,
  });

  Future<http.Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
  });
}
