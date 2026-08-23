import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/bucket_balances.dart';
import 'tables/buckets.dart';
import 'tables/categories.dart';
import 'tables/drops.dart';
import 'tables/icons.dart';
import '../enums/bucket_type.dart';
import '../enums/drop_type.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Buckets,
    BucketBalances,
    Categories,
    Drops,
    Icons,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
