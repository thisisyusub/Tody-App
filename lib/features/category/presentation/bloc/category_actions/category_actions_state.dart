part of 'category_actions_bloc.dart';

sealed class CategoryActionsState extends Equatable {
  const CategoryActionsState();

  @override
  List<Object?> get props => [];
}

class CategoryActionsInitial extends CategoryActionsState {}

class CategoryLaodingAction extends CategoryActionsState {}

class CategoryDeleteAction extends CategoryActionsState {}

class CategoryRenamingAction extends CategoryActionsState {}

class CategoryActionsFailure extends CategoryActionsState {
  const CategoryActionsFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class CategoryActionSuccess extends CategoryActionsState {
  const CategoryActionSuccess(this.categoryEntity);

  final CategoryEntity categoryEntity;

  @override
  List<Object?> get props => [categoryEntity];
}

class CategoryDeleteActionSuccess extends CategoryActionsState {}

class CategoryDataEmpty extends CategoryActionsState {}

class CategoryDeleteFailure extends CategoryActionsState {
  const CategoryDeleteFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
