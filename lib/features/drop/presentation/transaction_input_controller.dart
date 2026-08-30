import 'dart:async';
import 'package:bucket_drop/features/drop/data/drop_repository.dart';
import 'package:bucket_drop/features/drop/domain/drop.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_input_controller.g.dart';

/// 取引入力フォーム全体の状態
class TransactionInputState {
  const TransactionInputState({
    this.title = '',
    this.amount = '0',
    this.resetKey = 0,
  });

  final String title;
  final String amount;
  final int resetKey;

  int get parsedAmount => int.tryParse(amount) ?? 0;

  TransactionInputState copyWith({
    String? title,
    String? amount,
  }) {
    return TransactionInputState(
      title: title ?? this.title,
      amount: amount ?? this.amount,
    );
  }
}

@riverpod
class TransactionInputController extends _$TransactionInputController {
  Timer? _initialDelayTimer;
  Timer? _repeatTimer;

  @override
  TransactionInputState build() {
    ref.onDispose(_cancelTimers);
    return const TransactionInputState();
  }

  void _cancelTimers() {
    _initialDelayTimer?.cancel();
    _initialDelayTimer = null;
    _repeatTimer?.cancel();
    _repeatTimer = null;
  }

  /// タイトルの更新
  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  /// 金額：数字の入力
  void inputDigit(String digit) {
    const maxDigit = 10;
    final current = state.amount;

    if (current.length >= maxDigit) return;

    if (current == '0') {
      state = state.copyWith(amount: digit);
    } else {
      state = state.copyWith(amount: current + digit);
    }
  }

  /// 金額：クリア (0に戻す)
  void clearAmount() {
    state = state.copyWith(amount: '0');
  }

  /// 金額：1文字削除
  void deleteDigit() {
    final current = state.amount;
    if (current.length <= 1) {
      state = state.copyWith(amount: '0');
    } else {
      state = state.copyWith(amount: current.substring(0, current.length - 1));
    }
  }

  /// 金額：長押し削除開始
  void startDelete() {
    deleteDigit();
    _cancelTimers();
    _initialDelayTimer = Timer(const Duration(milliseconds: 400), () {
      _repeatTimer = Timer.periodic(const Duration(milliseconds: 80), (_) {
        deleteDigit();
      });
    });
  }

  /// 金額：削除タイマー停止
  void stopDelete() {
    _cancelTimers();
  }

  /// 取引の保存とフォームのリセット
  Future<void> save() async {
    final newDrop = Drop(
      title: state.title,
      amount: state.parsedAmount,
      date: DateTime.now(),
    );

    await ref.read(dropRepositoryProvider).insertDrop(newDrop);

    // 状態を初期状態に戻す（全UIパーツが自動的に初期状態を描画）
    state = TransactionInputState(resetKey: state.resetKey + 1);
  }
}
