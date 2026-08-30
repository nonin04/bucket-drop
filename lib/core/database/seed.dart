import 'package:drift/drift.dart';

/// 初期データ投入用の生SQL (DML)
/// セミコロン区切りで自由に INSERT 文などの SQL を記述・追加できます。
const String seedSql = '''
-- バケットカテゴリー
INSERT INTO bucket_categories (id, name) VALUES 
  (1, '銀行口座'),
  (2, '投資・証券'),
  (3, '電子マネー・現金'),
  (4, 'ポイント');

-- バケット
INSERT INTO buckets (id, name, bucket_category_id) VALUES 
  (1, '三井住友銀行', 1),
  (2, '三菱UFJ銀行', 1),
  (3, 'ゆうちょ銀行', 1),
  (4, '池田泉州銀行', 1),
  (5, '島根銀行', 1),
  (6, 'PayPay銀行', 1),
  (7, 'ドコモSMTBネット銀行', 1),
  (8, 'SBI証券', 2),
  (9, 'WealthNavi', 2),
  (10, 'ideco', 2),
  (11, '現金', 3),
  (12, 'Suica', 3),
  (13, 'PayPay', 3),
  (14, 'Vポイント', 4),
  (15, 'dポイント', 4);
''';

/// データベース作成・リセット時にシードSQLを実行する関数
Future<void> runSeed(GeneratedDatabase db) async {
  // セミコロンで分割して各ステートメントを順番に実行
  final statements = seedSql.split(';');

  for (final rawStatement in statements) {
    // 各行のコメント（-- から始まる行）を除去して整形
    final cleanLines = rawStatement
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty && !line.startsWith('--'))
        .toList();

    if (cleanLines.isEmpty) continue;

    final cleanSql = cleanLines.join(' ');
    try {
      await db.customStatement(cleanSql);
    } catch (e) {
      // ignore: avoid_print
      print('❌ Seed SQL Execution Error: $e\nSQL: $cleanSql');
    }
  }
}
