import 'dart:io';

import 'package:bucket_drop/core/database/seed.dart';
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
import 'package:sqflite/sqflite.dart' show getDatabasesPath;

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
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await runSeed(this);
      debugPrint('🌱 初回シードデータを投入しました');
    },
    beforeOpen: (details) async {
      // データベース起動時にバケットが0件なら確実にシードを実行
      final existingBuckets = await (select(buckets)..limit(1)).get();
      if (existingBuckets.isEmpty) {
        await runSeed(this);
        debugPrint('🌱 バケットが空だったためシードデータを自動投入しました');
      }
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
    final dbDirectory = await getDatabasesPath();

    final file = File(p.join(dbDirectory, 'db.sqlite'));
    debugPrint('📁 Database Path: ${file.path}');
    return NativeDatabase(file);
  });
}
