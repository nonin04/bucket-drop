import 'package:bucket_drop/core/database/tables/buckets.dart';
import 'package:drift/drift.dart';

@DataClassName('BucketSnapshotTable')
class BucketSnapshots extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bucketId => integer().references(Buckets, #id)();
  IntColumn get balance => integer()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
