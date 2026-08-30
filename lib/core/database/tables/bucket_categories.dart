import 'package:bucket_drop/core/enums/balance_type.dart';
import 'package:drift/drift.dart';

class BucketCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get balanceType => textEnum<BalanceType>()();
}
