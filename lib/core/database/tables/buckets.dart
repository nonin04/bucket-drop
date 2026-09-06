// dart format off
import 'package:bucket_drop/core/database/tables/bucket_categories.dart';
import 'package:drift/drift.dart';

//バケット
@DataClassName('BucketTable')
class Buckets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get isIncomeDefault => boolean().withDefault(const Constant(false))();
  BoolColumn get isExpenseDefault => boolean().withDefault(const Constant(false))();
  IntColumn get bucketCategoryId => integer().references(BucketCategories, #id, onDelete: KeyAction.restrict)();
  IntColumn get sort => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
