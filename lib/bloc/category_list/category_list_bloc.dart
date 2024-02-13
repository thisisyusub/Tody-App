import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tody_app/core/constants/app_keys.dart';
import 'package:http/http.dart' as http;

part 'category_list_event.dart';
part 'category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  CategoryListBloc() : super(CategoryListInitial()) {
    on<CategoryListRequested>(
      (event, emit) async {
        emit(CategoryListInProgress());
        final uri = Uri.http('localhost:8080', '/categories');
        const secureStorage = FlutterSecureStorage();
        final token = await secureStorage.read(key: AppKeys.token);

        final response = await http.get(
          uri,
          headers: {
            'Authorization': 'Basic $token',
          },
        );

        if (response.statusCode == 200) {
          final parsedBody = jsonDecode(response.body) as Map<String, dynamic>;
          final categoriesJson = parsedBody['data'] as List<dynamic>;

          final categories = <String>[];

          for (var categoryJson in categoriesJson) {
            categories.add(categoryJson['title']);
          }

          emit(CategoryListSuccess(categories));
        } else {
          final error = response.body;
          final parsedError = jsonDecode(error) as Map<String, dynamic>;
          emit(CategoryListFailure(parsedError['message']));
        }
      },
    );
  }
}
