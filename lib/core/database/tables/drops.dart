import 'package:bucket_drop/core/database/tables/buckets.dart';
import 'package:bucket_drop/core/database/tables/drop_categories.dart';
import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:drift/drift.dart';

@DataClassName('DropTable')
class Drops extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get amount => integer()();
  IntColumn get dropCategoryId =>
      integer().nullable().references(DropCategories, #id)();
  IntColumn get bucketId => integer().nullable().references(Buckets, #id)();
  IntColumn get toBucketId => integer().nullable().references(Buckets, #id)();
  TextColumn get dropType => textEnum<DropType>().nullable()();
  DateTimeColumn get date => dateTime()();
  TextColumn get notes => text().nullable()();
  IntColumn get parentDropId => integer().nullable().references(Drops, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
