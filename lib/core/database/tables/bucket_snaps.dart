// dart format off
import 'package:bucket_drop/core/database/tables/buckets.dart';
import 'package:drift/drift.dart';

//スナップショット
@DataClassName('BucketSnapTable')
class BucketSnaps extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bucketId => integer().references(Buckets, #id, onDelete: KeyAction.cascade)();
  IntColumn get amount => integer()();
  DateTimeColumn get snappedOn => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
