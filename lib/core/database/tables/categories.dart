import 'package:bucket_drop/core/database/tables/icons.dart';
import 'package:drift/drift.dart';

@DataClassName('CategoryTable')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get iconId => integer().references(Icons, #id)();
  TextColumn get name => text().nullable()();
}
