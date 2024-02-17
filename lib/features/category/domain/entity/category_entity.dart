import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  List<Object?> get props => [id, title];
}
