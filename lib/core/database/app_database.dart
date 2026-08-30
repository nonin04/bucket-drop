import 'dart:io';

import 'package:bucket_drop/core/database/tables/bucket_categories.dart';
import 'package:bucket_drop/core/database/tables/bucket_snapshots.dart';
import 'package:bucket_drop/core/database/tables/buckets.dart';
import 'package:bucket_drop/core/database/tables/drop_categories.dart';
import 'package:bucket_drop/core/database/tables/drops.dart';
import 'package:bucket_drop/core/database/tables/icons.dart';
import 'package:bucket_drop/core/enums/balance_type.dart';
import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Buckets,
    BucketSnapshots,
    BucketCategories,
    DropCategories,
    Drops,
    Icons,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      for (final table in allTables) {
        await m.deleteTable(table.actualTableName);
      }
      await m.createAll();
      debugPrint('新しいデータベースを作成しました');
    },
  );
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
    debugPrint('📁 Database Path: ${file.path}');
    return NativeDatabase(file);
  });
}
