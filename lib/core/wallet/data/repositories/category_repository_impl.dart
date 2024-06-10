import 'package:dartz/dartz.dart';
import 'package:money_manager/core/utils/typedefs.dart';
import 'package:money_manager/core/wallet/data/datasources/category_local_data_source.dart';
import 'package:money_manager/core/wallet/domain/entities/category_entity.dart';
import 'package:money_manager/core/wallet/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryLocalDataSource _dataSource;
  CategoryRepositoryImpl(this._dataSource);
  @override
  ResultFuture<void> addCategory(
      {required String categoryName,
      required int colorHex,
      required String description,
      required String categoryType,
      required String currency}) async {
    try {
      await _dataSource.addCategory(
          categoryName: categoryName,
          colorHex: colorHex,
          description: description,
          categoryType: categoryType,
          currency: currency);
      return const Right(null);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  ResultFuture<List<CategoryEntity>> getAllCategries() async {
    try {
      final result = await _dataSource.getAllCategries();
      return Right(result);
    } catch (e) {
      print(e);
      print("erreur");
      return Left(Exception(e));
    }
  }
}
