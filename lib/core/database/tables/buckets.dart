import 'package:bucket_drop/core/database/tables/icons.dart';
import 'package:bucket_drop/core/enums/bucket_type.dart';
import 'package:drift/drift.dart';

class Buckets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get bucketType => textEnum<BucketType>()();
  IntColumn get iconId => integer().references(Icons, #id)();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
