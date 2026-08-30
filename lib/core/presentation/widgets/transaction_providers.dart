import 'package:flutter_riverpod/flutter_riverpod.dart';

// タイトル状態を管理するNotifier
class TransactionTitle extends Notifier<String> {
  @override
  String build() => '';

  void set(String value) => state = value;

  void clear() => state = '';
}

final transactionTitleProvider = NotifierProvider<TransactionTitle, String>(
  TransactionTitle.new,
);
