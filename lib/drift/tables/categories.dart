import 'package:drift/drift.dart';
import 'icons.dart';
part '../categories.g.dart';

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get iconId => integer().references(Icons, #id)();
  TextColumn get name => text().nullable()();
}
