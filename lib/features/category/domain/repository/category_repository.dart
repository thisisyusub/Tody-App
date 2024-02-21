import 'package:tody_app/features/category/domain/entity/category_entity.dart';

abstract interface class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<void> deleteCategory(int id);
  Future<CategoryEntity> getCategory(int id);
}
