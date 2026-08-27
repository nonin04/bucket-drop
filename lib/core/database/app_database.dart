import 'dart:io';

import 'package:bucket_drop/core/database/tables/bucket_balances.dart';
import 'package:bucket_drop/core/database/tables/buckets.dart';
import 'package:bucket_drop/core/database/tables/categories.dart';
import 'package:bucket_drop/core/database/tables/drops.dart';
import 'package:bucket_drop/core/database/tables/icons.dart';
import 'package:bucket_drop/core/enums/bucket_type.dart';
import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

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

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
