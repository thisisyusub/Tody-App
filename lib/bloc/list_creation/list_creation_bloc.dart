import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:http/http.dart' as http;

part 'list_creation_event.dart';
part 'list_creation_state.dart';

class ListCreationBloc extends Bloc<ListCreationEvent, ListCreationState> {
  ListCreationBloc() : super(ListCreationInitial()) {
    on<NewListCreateRequested>(
      (event, emit) async {
        emit(ListCreationInProgress());
        final uri = Uri.http('localhost:8080', '/categories');
        const secureStorage = FlutterSecureStorage();
        final token = await secureStorage.read(key: AppKeys.token);

        final response = await http.post(
          uri,
          headers: {
            'Authorization': 'Basic $token',
          },
          body: jsonEncode({
            'title': event.title,
          }),
        );

        if (response.statusCode == 200) {
          emit(ListCreationSuccess());
        } else {
          final error = response.body;
          final parsedError = jsonDecode(error) as Map<String, dynamic>;
          emit(ListCreationFailure(parsedError['message']));
        }
      },
    );
  }
}
