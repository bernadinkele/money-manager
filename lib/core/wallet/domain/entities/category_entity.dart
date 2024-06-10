import 'package:isar/isar.dart';

part 'category_entity.g.dart';

@collection
class CategoryEntity {
  Id id = Isar.autoIncrement;
  String? categoryName;
  int? colorHex;
  String? description;
  String? categoryType;
  String? currency;
}
