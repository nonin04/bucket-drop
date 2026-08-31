import 'package:bucket_drop/core/enums/balance_type.dart';
import 'package:drift/drift.dart';

@DataClassName('BucketCategoryTable')
class BucketCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get balanceType => textEnum<BalanceType>()();
  IntColumn get sort => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
