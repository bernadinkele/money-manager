part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class CreateCategoryEvent extends CategoryEvent {
  CreateCategoryEvent(
      {required this.categoryName,
      required this.categoryType,
      required this.colorHex,
      required this.currency,
      required this.description});
  final String categoryName;
  final int colorHex;
  final String description;
  final String categoryType;
  final String currency;
}

class GetCategoriesEvent extends CategoryEvent {}
