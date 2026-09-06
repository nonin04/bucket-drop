import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

// コメントは記述しないこと
const String seedSql = '''

''';

Future<void> runSeed(GeneratedDatabase db) async {
  for (final statement in seedSql.split(';')) {
    final sql = statement.trim();
    if (sql.isEmpty) continue;

    try {
      await db.customStatement(sql);
    } on Exception catch (e) {
      debugPrint('/////////// Seed SQL Execution Error: $e\nSQL: $sql /////////// ');
    }
  }
}
