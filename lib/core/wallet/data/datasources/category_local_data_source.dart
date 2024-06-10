import 'package:isar/isar.dart';
import 'package:money_manager/core/wallet/domain/entities/category_entity.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryEntity>> getAllCategries();
  Future<void> addCategory({
    required String categoryName,
    required int colorHex,
    required String description,
    required String categoryType,
    required String currency,
  });
}

class CategoryLocalDataSourceImpl extends CategoryLocalDataSource {
  CategoryLocalDataSourceImpl(this._isar);
  final Isar _isar;

  @override
  Future<void> addCategory(
      {required String categoryName,
      required int colorHex,
      required String description,
      required String categoryType,
      required String currency}) async {
    var category = CategoryEntity();
    category.categoryName = categoryName;
    category.colorHex = colorHex;
    category.description = description;
    category.currency = currency;
    category.categoryType = categoryType;
    await _isar.writeTxn(() async {
      await _isar.categoryEntitys.put(category);
    });
  }

  @override
  Future<List<CategoryEntity>> getAllCategries() async {
    return await _isar.categoryEntitys.where().findAll();
  }
}
