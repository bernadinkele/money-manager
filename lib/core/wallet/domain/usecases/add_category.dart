import 'package:money_manager/core/utils/typedefs.dart';
import 'package:money_manager/core/utils/usecase.dart';
import 'package:money_manager/core/wallet/domain/repositories/category_repository.dart';

class AddCategory extends UseCaseWithParams<void, AddCategoryParams> {
  const AddCategory(this.repository);
  final CategoryRepository repository;
  @override
  ResultFuture<void> call(AddCategoryParams params) async =>
      repository.addCategory(
          categoryName: params.categoryName,
          colorHex: params.colorHex,
          description: params.description,
          categoryType: params.categoryType,
          currency: params.currency);
}

class AddCategoryParams {
  const AddCategoryParams(
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
