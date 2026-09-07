// dart format off
import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:drift/drift.dart';

//ドロップカテゴリ
@DataClassName('DropCategoryTable')
class DropCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get icon => text()();
  TextColumn get dropType => textEnum<DropType>()();
  IntColumn get budget => integer().withDefault(const Constant(0))();
  IntColumn get sort => integer()();
  BoolColumn get isSystem => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
