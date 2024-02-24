import 'package:tody_app/features/category/domain/entity/category_entity.dart';
import 'package:tody_app/features/category/domain/entity/category_update_entity.dart';

abstract interface class CategoryRepository {
  Future<void> createCategory(String title);
  Future<CategoryEntity> updateCategory(CategoryUpdateEntity entity);
  Future<List<CategoryEntity>> getCategories();
  Future<void> deleteCategory(int id);
  Future<CategoryEntity> getCategory(int id);
}
