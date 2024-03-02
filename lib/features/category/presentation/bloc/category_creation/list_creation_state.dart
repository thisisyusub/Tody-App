part of 'list_creation_bloc.dart';

sealed class ListCreationState extends Equatable {
  const ListCreationState();

  @override
  List<Object?> get props => [];
}

class ListCreationInitial extends ListCreationState {}

class ListCreationInProgress extends ListCreationState {}

class ListCreationFailure extends ListCreationState {
  const ListCreationFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class ListCreationSuccess extends ListCreationState {}
