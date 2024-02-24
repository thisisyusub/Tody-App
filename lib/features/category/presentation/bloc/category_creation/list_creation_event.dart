part of 'list_creation_bloc.dart';

abstract class ListCreationEvent extends Equatable {
  const ListCreationEvent();

  @override
  List<Object?> get props => [];
}

class NewListCreateRequested extends ListCreationEvent {
  const NewListCreateRequested(this.title);

  final String title;

  @override
  List<Object?> get props => [title];
}
