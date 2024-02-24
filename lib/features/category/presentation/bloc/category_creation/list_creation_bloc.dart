import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tody_app/core/exception/general_exception.dart';
import 'package:tody_app/data/model/error_response.dart';
import 'package:tody_app/features/category/domain/repository/category_repository.dart';

part 'list_creation_event.dart';
part 'list_creation_state.dart';

class CategoryCreationBloc extends Bloc<ListCreationEvent, ListCreationState> {
  CategoryCreationBloc(this.categoryRepository) : super(ListCreationInitial()) {
    on<NewListCreateRequested>(
      (event, emit) async {
        emit(ListCreationInProgress());

        try {
          await categoryRepository.createCategory(event.title);
          emit(ListCreationSuccess());
        } on ErrorResponse catch (e) {
          emit(ListCreationFailure(e.message));
        } on GeneralException catch (e) {
          emit(ListCreationFailure(e.message));
        }
      },
    );
  }

  final CategoryRepository categoryRepository;
}
