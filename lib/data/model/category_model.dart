import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Equatable {
  const CategoryModel({
    required this.id,
    required this.title,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  final int id;
  final String title;

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  List<Object?> get props => [id, title];
}
