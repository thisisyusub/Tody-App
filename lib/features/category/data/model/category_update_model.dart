import 'package:json_annotation/json_annotation.dart';

part 'category_update_model.g.dart';

/// DTO - Data Transfer Object
@JsonSerializable()
class CategoryUpdateModel {
  const CategoryUpdateModel({
    required this.categoryId,
    required this.title,
  });

  @JsonKey(includeToJson: false)
  final int categoryId;
  final String title;

  Map<String, dynamic> toJson() => _$CategoryUpdateModelToJson(this);
}
