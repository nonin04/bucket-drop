import 'package:flutter_riverpod/flutter_riverpod.dart';

// タイトル状態を管理するNotifier
class TransactionTitle extends Notifier<String> {
  @override
  String build() => '';

  void set(String value) => state = value;
}

final transactionTitleProvider = NotifierProvider<TransactionTitle, String>(TransactionTitle.new);

// 選択されたカテゴリー（絵文字付き文字列）を管理するNotifier
class TransactionCategory extends Notifier<String> {
  @override
  String build() => '🍔 食費';

  void set(String value) => state = value;
}

final transactionCategoryProvider = NotifierProvider<TransactionCategory, String>(TransactionCategory.new);
