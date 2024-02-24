import 'package:equatable/equatable.dart';

class CategoryUpdateEntity extends Equatable {
  const CategoryUpdateEntity({
    required this.categoryId,
    required this.title,
  });

  final int categoryId;
  final String title;

  @override
  List<Object?> get props => [categoryId, title];
}
