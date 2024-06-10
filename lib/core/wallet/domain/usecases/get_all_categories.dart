import 'package:money_manager/core/utils/typedefs.dart';
import 'package:money_manager/core/utils/usecase.dart';
import 'package:money_manager/core/wallet/domain/entities/category_entity.dart';
import 'package:money_manager/core/wallet/domain/repositories/category_repository.dart';

class GetCategories extends UseCaseWithOutParams<List<CategoryEntity>> {
  final CategoryRepository repository;
  const GetCategories(this.repository);
  @override
  ResultFuture<List<CategoryEntity>> call() async =>
      repository.getAllCategries();
}
