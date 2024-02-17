import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:tody_app/core/rest/rest_client.dart';
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
    } catch (e) {
      notifyListeners();
    }
  }
}
