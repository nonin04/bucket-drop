// dart format off
import 'package:bucket_drop/core/database/tables/drop_categories.dart';
import 'package:bucket_drop/core/database/tables/subscribed_drops.dart';
import 'package:drift/drift.dart';

//ドロップ
@DataClassName('DropTable')
class Drops extends Table {
  IntColumn get id => integer().autoIncrement()();
  // IntColumn get fromBucketId => integer().nullable().references(Buckets, #id, onDelete: KeyAction.restrict)();
  // IntColumn get toBucketId => integer().nullable().references(Buckets, #id, onDelete: KeyAction.restrict)();
  IntColumn get dropCategoryId => integer().nullable().references(DropCategories, #id, onDelete: KeyAction.setNull)();
  IntColumn get subscribedDropId => integer().nullable().references(SubscribedDrops, #id, onDelete: KeyAction.setNull)();
  IntColumn get parentDropId => integer().nullable().references(Drops, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text()();
  IntColumn get amount => integer()();
  DateTimeColumn get droppedOn => dateTime()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
