import 'package:tody_app/features/category/data/data_source/category_remote_data_source.dart';
import 'package:tody_app/features/category/domain/entity/category_entity.dart';
import 'package:tody_app/features/category/domain/repository/category_repository.dart';

final class CategoryRepositoryImpl implements CategoryRepository {
  const CategoryRepositoryImpl({required this.categoryRemoteDataSoure});

  final CategoryRemoteDataSoure categoryRemoteDataSoure;

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final categories = await categoryRemoteDataSoure.getCategories();
      return categories.map((category) => category.toEntity()).toList();
    } catch (_) {
      rethrow;
    }
  }
}
