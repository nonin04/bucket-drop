// dart format off
import 'package:bucket_drop/core/enums/balance_type.dart';
import 'package:drift/drift.dart';

//バケットカテゴリ
@DataClassName('BucketCategoryTable')
class BucketCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get icon => text()();
  TextColumn get balanceType => textEnum<BalanceType>()();
  IntColumn get sort => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
