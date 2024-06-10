import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:money_manager/core/wallet/domain/entities/category_entity.dart';
import 'package:money_manager/core/wallet/domain/usecases/add_category.dart';
import 'package:money_manager/core/wallet/domain/usecases/get_all_categories.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(
      {required AddCategory addCategory, required GetCategories getCategories})
      : _addCategory = addCategory,
        _getCategories = getCategories,
        super(CategoryInitial()) {
    on<CreateCategoryEvent>(_createCatgoryHandler);
    on<GetCategoriesEvent>(_getCatgoriesHandler);
  }
  final AddCategory _addCategory;
  final GetCategories _getCategories;
  Future<void> _createCatgoryHandler(
      CreateCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(CreatingCategoryState());
    final result = await _addCategory(AddCategoryParams(
        categoryName: event.categoryName,
        categoryType: event.categoryType,
        colorHex: event.colorHex,
        currency: event.currency,
        description: event.description));

    result.fold(
      (l) => emit(CategoryErrorState()),
      (r) => emit(CategoryCreatedState()),
    );
  }

  Future<void> _getCatgoriesHandler(
      GetCategoriesEvent event, Emitter<CategoryState> emit) async {
    final result = await _getCategories();

    result.fold(
      (l) => emit(CategoryErrorState()),
      (r) => emit(CategoryGettedState(r)),
    );
  }
}
