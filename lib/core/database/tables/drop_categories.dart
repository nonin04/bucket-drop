import 'package:bucket_drop/core/database/tables/icons.dart';
import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:drift/drift.dart';

@DataClassName('DropCategoryTable')
class DropCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get iconId => integer().references(Icons, #id)();
  TextColumn get name => text()();
  TextColumn get dropType => textEnum<DropType>()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
