part of 'category_list_bloc.dart';

sealed class CategoryListState extends Equatable {
  const CategoryListState();

  @override
  List<Object?> get props => [];
}

class CategoryListInitial extends CategoryListState {}

class CategoryListInProgress extends CategoryListState {}

class CategoryListFailure extends CategoryListState {
  const CategoryListFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class CategoryListSuccess extends CategoryListState {
  const CategoryListSuccess(this.categories);

  final List<String> categories;

  @override
  List<Object?> get props => [categories];
}
