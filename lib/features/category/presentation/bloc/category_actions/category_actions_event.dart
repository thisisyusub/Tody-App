part of 'category_actions_bloc.dart';

abstract class CategoryActionsEvent extends Equatable {
  const CategoryActionsEvent();

  @override
  List<Object?> get props => [];
}

class CategoryDetailsRequested extends CategoryActionsEvent {
  const CategoryDetailsRequested(this.id);

  final int id;

  @override
  List<Object?> get props => [id];
}

class CategoryDeleteRequested extends CategoryActionsEvent {}

class CategoryUpdateRequested extends CategoryActionsEvent {
  const CategoryUpdateRequested(this.title);

  final String title;

  @override
  List<Object?> get props => [title];
}
