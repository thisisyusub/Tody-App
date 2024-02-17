import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tody_app/core/exception/empty_data_exception.dart';
import 'package:tody_app/data/model/error_response.dart';
import 'package:tody_app/features/category/domain/entity/category_entity.dart';
import 'package:tody_app/features/category/domain/repository/category_repository.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final CategoryRepository categoryRepository;

  CategoryListBloc({
    required this.categoryRepository,
  }) : super(CategoryListInitial()) {
    on<CategoryListRequested>(
      (event, emit) async {
        emit(CategoryListInProgress());

        try {
          final categories = await categoryRepository.getCategories();
          emit(CategoryListSuccess(categories));
        } on EmptyDataException {
          emit(CategoryListEmpty());
        } on ErrorResponse catch (e) {
          emit(CategoryListFailure(e.message));
        } catch (_) {
          emit(const CategoryListFailure());
        }
      },
    );
  }
}
