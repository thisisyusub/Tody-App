import 'package:tody_app/features/category/data/model/category_model.dart';
import 'package:tody_app/features/category/domain/entity/category_entity.dart';

abstract class CategoryMapper {
  static CategoryEntity toEntity(CategoryModel model) {
    return CategoryEntity(
      id: model.id,
      title: model.title,
    );
  }

  static List<CategoryEntity> toEntityList(List<CategoryModel> categories) {
    return categories
        .map((category) => CategoryMapper.toEntity(category))
        .toList();
  }
}
