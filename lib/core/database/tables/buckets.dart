import 'package:bucket_drop/core/database/tables/bucket_categories.dart';
import 'package:bucket_drop/core/database/tables/icons.dart';
import 'package:drift/drift.dart';

@DataClassName('BucketTable')
class Buckets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get bucketCategoryId =>
      integer().references(BucketCategories, #id)();
  IntColumn get iconId => integer().references(Icons, #id).nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get sort => integer().withDefault(const Constant(0))();
  BoolColumn get isDefaultExpense => boolean().nullable()();
  BoolColumn get isDefaultIncome => boolean().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
