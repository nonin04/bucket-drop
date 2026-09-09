// dart format off
// import 'package:bucket_drop/core/database/tables/buckets.dart';
import 'package:bucket_drop/core/database/tables/drop_categories.dart';
import 'package:bucket_drop/core/enums/frequency.dart';
import 'package:drift/drift.dart';

//定期ドロップ
@DataClassName('SubscribedDropTable')
class SubscribedDrops extends Table {
  IntColumn get id => integer().autoIncrement()();
  @ReferenceName('fromBucketId')
  // IntColumn get fromBucketId => integer().nullable().references(Buckets, #id, onDelete: KeyAction.restrict)();
  @ReferenceName('toBucketId')
  // IntColumn get toBucketId => integer().nullable().references(Buckets, #id, onDelete: KeyAction.restrict)();
  IntColumn get dropCategoryId => integer().nullable().references(DropCategories, #id, onDelete: KeyAction.setNull)();
  TextColumn get title => text()();
  IntColumn get amount => integer()();
  TextColumn get frequency => textEnum<Frequency>()();
  IntColumn get repeatInterval => integer().withDefault(const Constant(1))();
  DateTimeColumn get startsOn => dateTime()();
  DateTimeColumn get endsOn => dateTime().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
