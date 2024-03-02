import 'package:tody_app/features/category/data/model/category_update_model.dart';
import 'package:tody_app/features/category/domain/entity/category_update_entity.dart';

abstract class CategoryUpdateMapper {
  static CategoryUpdateModel fromEntity(CategoryUpdateEntity entity) {
    return CategoryUpdateModel(
      categoryId: entity.categoryId,
      title: entity.title,
    );
  }
}
