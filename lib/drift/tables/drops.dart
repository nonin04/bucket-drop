import 'package:drift/drift.dart';
import '../../models/enums/drop_type.dart';
import 'categories.dart';
import 'buckets.dart';
part '../drops.g.dart';

class Drops extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get amount => integer()();
  IntColumn get categoryId => integer().references(Categories, #id)();
  IntColumn get bucketId => integer().references(Buckets, #id)();
  IntColumn get toBucketId => integer().nullable().references(Buckets, #id)();
  TextColumn get dropType => textEnum<DropType>()();
  DateTimeColumn get date => dateTime()();
  TextColumn get notes => text().nullable()();
  IntColumn get parentDropId => integer().nullable().references(Drops, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DriftDatabase(tables: [Drops])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

Future<DatabaseConnection> _openConnection() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, 'db.sqlite'));
  return DatabaseConnection(file);
}
