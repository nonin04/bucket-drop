// dart format off
import 'package:bucket_drop/core/enums/bucket_category.dart';
import 'package:drift/drift.dart';

//バケット
@DataClassName('BucketTable')
class Buckets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get isIncomeDefault => boolean().withDefault(const Constant(false))();
  BoolColumn get isExpenseDefault => boolean().withDefault(const Constant(false))();
  TextColumn get bucketCategory => textEnum<BucketCategory>()();
  RealColumn get expectedRate => real().withDefault(const Constant<double>(0))();
  IntColumn get sort => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
