import 'package:drift/drift.dart';
import '../../models/enums/bucket_type.dart';
import 'icons.dart';
part '../buckets.g.dart';

class Buckets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get bucketType => textEnum<BucketType>()();
  IntColumn get iconId => integer().references(Icons, #id)();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
