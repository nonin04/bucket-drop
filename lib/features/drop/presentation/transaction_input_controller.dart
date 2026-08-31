import 'dart:async';
import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/drop/data/drop_repository.dart';
import 'package:bucket_drop/features/drop/domain/drop.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_input_controller.g.dart';

/// 取引入力フォーム全体の状態
class TransactionInputState {
  const TransactionInputState({
    this.title = '',
    this.amount = '0',
    this.dropType = DropType.expense,
    this.bucketId,
    this.toBucketId,
    this.resetKey = 0,
  });

  final String title;
  final String amount;
  final DropType dropType;
  final int? bucketId;
  final int? toBucketId;
  final int resetKey;

  int get parsedAmount => int.tryParse(amount) ?? 0;

  TransactionInputState copyWith({
    String? title,
    String? amount,
    DropType? dropType,
    int? Function()? bucketId,
    int? Function()? toBucketId,
  }) {
    return TransactionInputState(
      title: title ?? this.title,
      amount: amount ?? this.amount,
      dropType: dropType ?? this.dropType,
      bucketId: bucketId != null ? bucketId() : this.bucketId,
      toBucketId: toBucketId != null ? toBucketId() : this.toBucketId,
      resetKey: resetKey,
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

  /// 取引タイプ（収入・支出・振替）の更新
  void updateDropType(DropType type) {
    state = state.copyWith(dropType: type);
  }

  /// 出金元/対象バケットの更新
  void updateBucketId(int? bucketId) {
    state = state.copyWith(bucketId: () => bucketId);
  }

  /// 振替先バケットの更新
  void updateToBucketId(int? toBucketId) {
    state = state.copyWith(toBucketId: () => toBucketId);
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
      bucketId: state.bucketId,
      toBucketId: state.dropType == DropType.transfer ? state.toBucketId : null,
      date: DateTime.now(),
    );

    await ref.read(dropRepositoryProvider).insertDrop(newDrop);

    // 状態を初期状態に戻す（選択中バケット・dropTypeは引き継ぐ）
    state = TransactionInputState(
      dropType: state.dropType,
      bucketId: state.bucketId,
      toBucketId: state.toBucketId,
      resetKey: state.resetKey + 1,
    );
  }
}
