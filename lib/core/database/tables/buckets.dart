import 'package:bucket_drop/core/database/tables/bucket_categories.dart';
import 'package:bucket_drop/core/database/tables/icons.dart';
import 'package:drift/drift.dart';

@DataClassName('BucketTable')
class Buckets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get bucketCategoryId => integer().references(BucketCategories, #id)();
  IntColumn get iconId => integer().references(Icons, #id)();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
