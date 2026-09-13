import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

// コメントは記述しないこと
const String seedSql = '''
INSERT OR REPLACE INTO drop_categories (id, name, icon, drop_type, budget, sort, is_system)
VALUES
  (99997, '手数料', 'receipt_long', 'expense', 0, 99997, true),
  (99998, '雑費', 'more_horiz', 'expense', 0, 99998, true),
  (99999, '雑収入', 'savings', 'income', 0, 99999, true);
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
