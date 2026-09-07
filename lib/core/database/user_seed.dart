import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

// コメントは記述しないこと
const String seedSql = '''
  INSERT INTO bucket_snaps (bucket_id, amount, snapped_on)
  VALUES
  (1, 0, '2025-01-01'),
  (2, 0, '2025-01-01'),
  (3, 0, '2025-01-01'),
  (4, 0, '2025-01-01'),
  (5, 0, '2025-01-01'),
  (6, 0, '2025-01-01'),
  (7, 0, '2025-01-01'),
  (8, 0, '2025-01-01'),
  (9, 0, '2025-01-01'),
  (10, 0, '2025-01-01'),
  (11, 0, '2025-01-01'),
  (12, 0, '2025-01-01'),
  (13, 0, '2025-01-01'),
  (14, 0, '2025-01-01');

  INSERT INTO buckets (id, name, is_income_default, is_expense_default, bucket_category_id, sort)
  VALUES
  (1, 'クレジットカード', 0, 1, 'credit', 0.0, 0),
  (2, '三井住友銀行', 1, 0, 'bank', 0.0, 1),
  (3, '三菱UFJ銀行', 0, 1, 'bank', 0.0, 2),
  (4, 'ドコモSMTBネット銀行', 0, 0, 'bank', 0.0, 3),
  (5, 'ゆうちょ銀行', 0, 0, 'bank', 0.0, 4),
  (6, '島根銀行', 0, 0, 'bank', 0.0, 5),
  (7, '池田泉州銀行', 0, 0, 'bank', 0.0, 6),
  (8, 'SBI証券', 0, 0, 'security', 0.0, 7),
  (9, 'iDeCo', 0, 0, 'security', 0.0, 8),
  (10, '財布', 0, 0, 'cash', 0.0, 9),
  (11, 'PayPay', 0, 0, 'cash', 0.0, 10),
  (12, 'PASMO', 0, 0, 'cash', 0.0, 11),
  (13, 'Vポイント', 0, 0, 'point', 0.0, 12),
  (14, 'dポイント', 0, 0, 'point', 0.0, 13);

INSERT INTO drop_categories (name, icon, drop_type, budget, sort, is_system)
VALUES
  ('食費', 'restaurant', 'expense', 0, 0, false),
  ('日用品費', 'shopping_cart', 'expense', 0, 1, false),
  ('住居費', 'home', 'expense', 0, 2, false),
  ('水道光熱費', 'bolt', 'expense', 0, 3, false),
  ('通信費', 'smartphone', 'expense', 0, 4, false),
  ('交通費', 'directions_bus', 'expense', 0, 5, false),
  ('給与', 'payments', 'income', 0, 6, false),
  ('配当・分配金', 'trending_up', 'income', 0, 7, false);


  
''';

Future<void> runUserSeed(GeneratedDatabase db) async {
  for (final statement in seedSql.split(';')) {
    final sql = statement.trim();
    if (sql.isEmpty) continue;

    try {
      await db.customStatement(sql);
    } on Exception catch (e) {
      debugPrint(
        '/////////// UserSeed SQL Execution Error: $e\nSQL: $sql /////////// ',
      );
    }
  }
}
