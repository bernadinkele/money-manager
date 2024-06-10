import 'package:flutter/foundation.dart';
import 'package:money_manager/core/utils/typedefs.dart';
import 'package:money_manager/core/wallet/domain/entities/category_entity.dart';

abstract class CategoryRepository {
 ResultFuture<List<CategoryEntity>> getAllCategries();
  ResultFuture<void> addCategory({
    required String categoryName,
    required int colorHex,
    required String description,
    required String categoryType,
    required String currency,
  });
}
