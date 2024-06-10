part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

class CreatingCategoryState extends CategoryState {}

class CategoryCreatedState extends CategoryState {}

class CategoryErrorState extends CategoryState {}

class CategoryGettingState extends CategoryState {}

// ignore: must_be_immutable
class CategoryGettedState extends CategoryState {
  List<CategoryEntity> categories;
  CategoryGettedState(this.categories);
}
