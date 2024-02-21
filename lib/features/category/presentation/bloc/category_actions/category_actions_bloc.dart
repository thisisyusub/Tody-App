import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tody_app/core/exception/data_not_found_exception.dart';
import 'package:tody_app/core/exception/empty_data_exception.dart';
import 'package:tody_app/data/model/error_response.dart';
import 'package:tody_app/features/category/domain/entity/category_entity.dart';
import 'package:tody_app/features/category/domain/repository/category_repository.dart';

part 'category_actions_state.dart';
part 'category_actions_event.dart';

class CategoryActionsBloc
    extends Bloc<CategoryActionsEvent, CategoryActionsState> {
  CategoryActionsBloc({required this.categoryRepository})
      : super(CategoryActionsInitial()) {
    on<CategoryDetailsRequested>(_getCategoryDetails);
    on<CategoryDeleteRequested>(_deleteCategory);
  }

  final CategoryRepository categoryRepository;
  int? _categoryId;

  _getCategoryDetails(
    CategoryDetailsRequested event,
    Emitter<CategoryActionsState> emit,
  ) async {
    emit(CategoryLaodingAction());
    try {
      _categoryId = event.id;
      final category = await categoryRepository.getCategory(event.id);
      emit(CategoryActionSuccess(category));
    } on EmptyDataException {
      emit(CategoryDataEmpty());
    } on ErrorResponse catch (e) {
      emit(CategoryActionsFailure(e.message));
    } catch (e) {
      emit(CategoryActionsFailure(e.toString()));
    }
  }

  _deleteCategory(
    CategoryDeleteRequested event,
    Emitter<CategoryActionsState> emit,
  ) async {
    try {
      emit(CategoryDeleteAction());
      await categoryRepository.deleteCategory(_categoryId!);
      emit(CategoryDeleteActionSuccess());
    } on DataNotFoundException catch (e) {
      emit(CategoryDeleteFailure(e.message));
    } on ErrorResponse catch (e) {
      emit(CategoryDeleteFailure(e.message));
    } catch (e) {
      emit(CategoryDeleteFailure(e.toString()));
    }
  }
}
