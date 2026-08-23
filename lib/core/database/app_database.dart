import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/bucket_balances.dart';
import 'tables/buckets.dart';
import 'tables/categories.dart';
import 'tables/drops.dart';
import 'tables/icons.dart';

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
  AppDatabase() : super(_openConnection);

  @override
  int get schemaVersion => 1;
}
