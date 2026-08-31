import 'package:drift/drift.dart';

/// 初期データ投入用の生SQL (DML)
/// セミコロン区切りで自由に INSERT 文などの SQL を記述・追加できます。
const String seedSql = '''
-- バケットカテゴリー
INSERT INTO bucket_categories (id, name, balance_type, sort) VALUES 
  (1, '銀行口座', 'asset', 1),
  (2, '投資・証券', 'asset', 2),
  (3, '電子マネー・現金', 'asset', 3),
  (4, 'ポイント', 'asset', 4),
  (5, 'クレジットカード', 'liability', 5);

-- バケット
INSERT INTO buckets (id, name, bucket_category_id, sort) VALUES 
  (1, '三井住友銀行', 1, 1),
  (2, '三菱UFJ銀行', 1, 2),
  (3, 'ゆうちょ銀行', 1, 3),
  (4, '池田泉州銀行', 1, 4),
  (5, '島根銀行', 1, 5),
  (6, 'PayPay銀行', 1, 6),
  (7, 'ドコモSMTBネット銀行', 1, 7),
  (8, 'SBI証券', 2, 8),
  (9, 'WealthNavi', 2, 9),
  (10, 'ideco', 2, 10),
  (11, '現金', 3, 11),
  (12, 'PASMO', 3, 12),
  (13, 'PayPay', 3, 13),
  (14, 'Vポイント', 4, 14),
  (15, 'dポイント', 4, 15),
  (16, 'クレジットカード', 5, 16);


-- アイコン
INSERT INTO icons (id, code_point, font_family, name) VALUES 
  (1, 0xe532, 'MaterialIcons', 'restaurant'),
  (2, 0xe59c, 'MaterialIcons', 'shopping_bag'),
  (3, 0xe1d7, 'MaterialIcons', 'directions_transit'),
  (4, 0xe318, 'MaterialIcons', 'home'),
  (5, 0xe3ab, 'MaterialIcons', 'bolt'),
  (6, 0xe6e8, 'MaterialIcons', 'water_drop'),
  (7, 0xe4a2, 'MaterialIcons', 'phone_iphone'),
  (8, 0xe170, 'MaterialIcons', 'checkroom'),
  (9, 0xe3fa, 'MaterialIcons', 'medical_services'),
  (10, 0xe405, 'MaterialIcons', 'sports_esports'),
  (11, 0xe072, 'MaterialIcons', 'attractions'),
  (12, 0xe283, 'MaterialIcons', 'flight'),
  (13, 0xe54d, 'MaterialIcons', 'school'),
  (14, 0xe30a, 'MaterialIcons', 'health_and_safety'),
  (15, 0xe040, 'MaterialIcons', 'account_balance'),
  (16, 0xe156, 'MaterialIcons', 'business_center'),
  (17, 0xe666, 'MaterialIcons', 'trending_down'),
  (18, 0xe317, 'MaterialIcons', 'help_outline'),
  (19, 0xe463, 'MaterialIcons', 'payments'),
  (20, 0xe51e, 'MaterialIcons', 'redeem'),
  (21, 0xe3e0, 'MaterialIcons', 'work'),
  (22, 0xe667, 'MaterialIcons', 'trending_up'),
  (23, 0xe577, 'MaterialIcons', 'savings'),
  (24, 0xe160, 'MaterialIcons', 'card_giftcard'),
  (25, 0xe3ef, 'MaterialIcons', 'monetization_on'),
  (26, 0xe000, 'MaterialIcons', 'account_balance_wallet'),
  (27, 0xe577, 'MaterialIcons', 'savings'),
  (28, 0xe19f, 'MaterialIcons', 'credit_card'),
  (29, 0xe5d8, 'MaterialIcons', 'swap_horiz');

INSERT INTO drop_categories (id, icon_id, name, drop_type, note, sort) VALUES
  (1, 1, '食費', 'expense', null, 1),
  (2, 2, '日用品費', 'expense', null, 2),
  (3, 3, '交通費', 'expense', null, 3),
  (4, 4, '家賃', 'expense', null, 4),
  (5, 5, '電気ガス', 'expense', null, 5),
  (6, 6, '水道代', 'expense', null, 6),
  (7, 7, '通信費', 'expense', null, 7),
  (8, 8, '衣服・美容', 'expense', null, 8),
  (9, 9, '医療費', 'expense', null, 9),
  (10, 10, '娯楽固定費', 'expense', null, 10),
  (11, 11, '日常レジャー', 'expense', null, 11),
  (12, 12, '旅費', 'expense', null, 12),
  (13, 13, '学習費', 'expense', null, 13),
  (14, 14, '保険', 'expense', null, 14),
  (15, 15, '学費ローン', 'expense', null, 15),
  (16, 16, '経費', 'expense', null, 16),
  (17, 17, '投資売却損', 'expense', null, 17),
  (18, 18, '差額精算(支出)', 'expense', null, 18),
  (19, 19, '給与', 'income', null, 19),
  (20, 20, '賞与', 'income', null, 20),
  (21, 21, '副業', 'income', null, 21),
  (22, 22, '配当金', 'income', null, 22),
  (23, 23, '投資売却益', 'income', null, 23),
  (24, 24, '贈与', 'income', null, 24),
  (25, 25, 'その他収入', 'income', null, 25),
  (26, 26, '差額精算(収入)', 'income', null, 26),
  (27, 27, '積立[基本]', 'transfer', null, 27),
  (28, 28, '積立[余剰]', 'transfer', null, 28),
  (29, 29, 'クレカ・負債返済', 'transfer', null, 29),
  (30, 30, '口座間振替', 'transfer', null, 30);
  
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
