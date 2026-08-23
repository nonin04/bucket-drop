import 'package:drift/drift.dart';
import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/core/database/tables/categories.dart';
import 'package:bucket_drop/core/database/tables/buckets.dart';

class Drops extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get amount => integer()();
  IntColumn get categoryId => integer().references(Categories, #id)();
  IntColumn get bucketId => integer().references(Buckets, #id)();
  IntColumn get toBucketId => integer().nullable().references(Buckets, #id)();
  TextColumn get dropType => textEnum<DropType>()();
  DateTimeColumn get date => dateTime()();
  TextColumn get notes => text().nullable()();
  IntColumn get parentDropId => integer().nullable().references(Drops, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
