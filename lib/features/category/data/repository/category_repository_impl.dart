import 'package:tody_app/features/category/data/data_source/category_remote_data_source.dart';
import 'package:tody_app/features/category/data/mapper/category_mapper.dart';
import 'package:tody_app/features/category/data/mapper/category_update_mapper.dart';
import 'package:tody_app/features/category/domain/entity/category_entity.dart';
import 'package:tody_app/features/category/domain/entity/category_update_entity.dart';
import 'package:tody_app/features/category/domain/repository/category_repository.dart';

final class CategoryRepositoryImpl implements CategoryRepository {
  const CategoryRepositoryImpl({required this.categoryRemoteDataSoure});

  final CategoryRemoteDataSoure categoryRemoteDataSoure;

  @override
  Future<void> createCategory(String title) =>
      categoryRemoteDataSoure.createNewCategory(title);

  @override
  Future<CategoryEntity> updateCategory(CategoryUpdateEntity entity) async {
    final category = await categoryRemoteDataSoure.updateCategory(
      CategoryUpdateMapper.fromEntity(entity),
    );
    return CategoryMapper.toEntity(category);
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final categories = await categoryRemoteDataSoure.getCategories();
    return CategoryMapper.toEntityList(categories);
  }

  @override
  Future<void> deleteCategory(int id) => categoryRemoteDataSoure.delete(id);

  @override
  Future<CategoryEntity> getCategory(int id) async {
    final category = await categoryRemoteDataSoure.getCategory(id);
    return CategoryMapper.toEntity(category);
  }
}
