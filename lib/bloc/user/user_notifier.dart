import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
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
      RestClient client = GetIt.instance.get<RestClient>();

      final response = await client.get('/auth/user');

      final userResponse = User.fromJson(response.data);

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
