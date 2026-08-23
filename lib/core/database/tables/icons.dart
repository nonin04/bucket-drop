import 'package:drift/drift.dart';

class Icons extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get codePoint => integer()();
  TextColumn get fontFamily =>
      text().withDefault(const Constant('MaterialIcons'))();
  TextColumn get name => text().nullable()();
}
