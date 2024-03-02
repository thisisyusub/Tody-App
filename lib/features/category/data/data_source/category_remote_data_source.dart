import 'dart:io';

import 'package:tody_app/core/exception/general_exception.dart';
import 'package:tody_app/core/rest/rest_client.dart';
import 'package:tody_app/data/model/error_response.dart';
import 'package:tody_app/core/exception/data_not_found_exception.dart';
import 'package:tody_app/core/exception/empty_data_exception.dart';
import 'package:tody_app/features/category/data/model/category_model.dart';
import 'package:tody_app/features/category/data/model/category_update_model.dart';

abstract interface class CategoryRemoteDataSoure {
  Future<void> createNewCategory(String title);
  Future<CategoryModel> updateCategory(CategoryUpdateModel model);
  Future<List<CategoryModel>> getCategories();
  Future<void> delete(int id);
  Future<CategoryModel> getCategory(int id);
}

final class CategoryRemoteDataSoureImpl implements CategoryRemoteDataSoure {
  const CategoryRemoteDataSoureImpl({required this.client});

  final RestClient client;

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await client.get('/categories');
      final data = response.data as List<dynamic>;

      if (data.isEmpty) {
        throw const EmptyDataException();
      }

      return data.map((category) => CategoryModel.fromJson(category)).toList();
    } on ErrorResponse {
      rethrow;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        GeneralException(e.toString()),
        stackTrace,
      );
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.delete('/categories/$id');
    } on ErrorResponse catch (e) {
      if (e.statusCode == HttpStatus.notFound) {
        throw DataNotFoundException(e.message);
      }

      rethrow;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        GeneralException(e.toString()),
        stackTrace,
      );
    }
  }

  @override
  Future<CategoryModel> getCategory(int id) async {
    try {
      final response = await client.get('/categories/$id');
      final data = response.data as Map<String, dynamic>;

      if (data.isEmpty) {
        throw const EmptyDataException();
      }

      return CategoryModel.fromJson(data);
    } on ErrorResponse {
      rethrow;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        GeneralException(e.toString()),
        stackTrace,
      );
    }
  }

  @override
  Future<void> createNewCategory(String title) async {
    try {
      await client.post('/categories', body: {'title': title});
    } on ErrorResponse {
      rethrow;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        GeneralException(e.toString()),
        stackTrace,
      );
    }
  }

  @override
  Future<CategoryModel> updateCategory(CategoryUpdateModel model) async {
    try {
      final response = await client.patch(
        '/categories/${model.categoryId}',
        body: model.toJson(),
      );

      return CategoryModel.fromJson(response.data);
    } on ErrorResponse {
      rethrow;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        GeneralException(e.toString()),
        stackTrace,
      );
    }
  }
}
