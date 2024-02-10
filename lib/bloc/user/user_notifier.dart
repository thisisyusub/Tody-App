import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:tody_app/core/rest/http_rest_client.dart';
import 'package:tody_app/core/rest/rest_client.dart';
import 'package:tody_app/data/model/error_response.dart';
import 'package:tody_app/data/model/user.dart';

class UserNotifier extends ChangeNotifier {
  User? user;

  Future<void> fetchUser() async {
    try {
      final uri = Uri.http('localhost:8080', '/auth/user');
      const secureStorage = FlutterSecureStorage();
      final token = await secureStorage.read(key: AppKeys.token);
      RestClient client = HttpRestClient(http.Client());

      final response = await client.get(
        uri,
        headers: {
          'Authorization': 'Basic $token',
        },
      );

      final decodedUser = jsonDecode(response.body);
      final userResponse = User.fromJson(decodedUser['data']);

      final nameWords = userResponse.fullName.split(' ');
      final buffer = StringBuffer();

      for (var word in nameWords) {
        buffer.write(word[0]);
      }

      final updatedUser = userResponse.copyWith(
        avatarLabel: buffer.toString(),
      );

      user = updatedUser;

      notifyListeners();
    } on ErrorResponse catch (e) {
      //  _loginState = ErrorState(e.message);
      notifyListeners();
    } catch (e) {
      // _loginState = ErrorState(e.toString());
      notifyListeners();
    } catch (_) {}
  }
}
