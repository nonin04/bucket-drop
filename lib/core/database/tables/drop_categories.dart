import 'package:bucket_drop/core/database/tables/icons.dart';
import 'package:drift/drift.dart';

@DataClassName('DropCategoryTable')
class DropCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get iconId => integer().references(Icons, #id).nullable()();
  TextColumn get name => text().nullable()();
}
