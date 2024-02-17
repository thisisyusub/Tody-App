import 'package:json_annotation/json_annotation.dart';
import 'package:tody_app/features/category/domain/entity/category_entity.dart';

part 'category_dto.g.dart';

/// DTO - Data Transfer Object
@JsonSerializable()
class CategoryDto {
  const CategoryDto({
    required this.id,
    required this.title,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  final int id;
  final String title;

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      title: title,
    );
  }
}
