import 'package:tody_app/core/exception/empty_data_exception.dart';
import 'package:tody_app/core/exception/general_exception.dart';
import 'package:tody_app/core/rest/rest_client.dart';
import 'package:tody_app/data/model/error_response.dart';
import 'package:tody_app/features/category/data/dto/category_dto.dart';

abstract interface class CategoryRemoteDataSoure {
  Future<List<CategoryDto>> getCategories();
}

final class CategoryRemoteDataSoureImpl implements CategoryRemoteDataSoure {
  const CategoryRemoteDataSoureImpl({required this.client});

  final RestClient client;

  @override
  Future<List<CategoryDto>> getCategories() async {
    try {
      final response = await client.get('/categories');
      final data = response.data as List<dynamic>;

      if (data.isEmpty) {
        throw const EmptyDataException();
      }

      return data.map((category) => CategoryDto.fromJson(category)).toList();
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
