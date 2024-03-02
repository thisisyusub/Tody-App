import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

/// DTO - Data Transfer Object
@JsonSerializable()
class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.title,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  final int id;
  final String title;

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
