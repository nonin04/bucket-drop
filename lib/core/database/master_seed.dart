import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

// コメントは記述しないこと
const String seedSql = '''
INSERT INTO drop_categories (name, icon, drop_type, budget, sort, is_system)
VALUES
  ('手数料', 'receipt_long', 'expense', 0, 99997, true),
  ('雑費', 'more_horiz', 'expense', 0, 99998, true),
  ('雑収入', 'savings', 'income', 0, 99999, true);
''';

Future<void> runMasterSeed(GeneratedDatabase db) async {
  for (final statement in seedSql.split(';')) {
    final sql = statement.trim();
    if (sql.isEmpty) continue;

    try {
      await db.customStatement(sql);
    } on Exception catch (e) {
      debugPrint(
        '/////////// MasterSeed SQL Execution Error: $e\nSQL: $sql /////////// ',
      );
    }
  }
}
