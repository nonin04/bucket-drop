import 'dart:async';
import 'package:bucket_drop/core/enums/drop_type.dart';
import 'package:bucket_drop/features/bucket/domain/bucket.dart';
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
    this.dropCategoryId,
    this.bucketId,
    this.toBucketId,
    this.resetKey = 0,
  });

  final String title;
  final String amount;
  final DropType dropType;
  final int? dropCategoryId;
  final int? bucketId;
  final int? toBucketId;
  final int resetKey;

  int get parsedAmount => int.tryParse(amount) ?? 0;

  /// バリデーションチェック（エラーがある場合はエラーメッセージ、なければ null）
  String? get validationError {
    if (parsedAmount <= 0) {
      return '金額を1円以上で入力してください';
    }
    if (dropCategoryId == null) {
      return 'カテゴリーを選択してください';
    }
    if (dropType == DropType.transfer) {
      if (bucketId == null) {
        return '出金元バケットを選択してください';
      }
      if (toBucketId == null) {
        return '入金先バケットを選択してください';
      }
      if (bucketId == toBucketId) {
        return '出金元と入金先には異なるバケットを選択してください';
      }
    } else {
      if (bucketId == null) {
        return 'バケットを選択してください';
      }
    }
    return null;
  }

  /// 全ての必須入力が揃っているかどうか
  bool get isValid => validationError == null;

  TransactionInputState copyWith({
    String? title,
    String? amount,
    DropType? dropType,
    int? Function()? dropCategoryId,
    int? Function()? bucketId,
    int? Function()? toBucketId,
  }) {
    return TransactionInputState(
      title: title ?? this.title,
      amount: amount ?? this.amount,
      dropType: dropType ?? this.dropType,
      dropCategoryId:
          dropCategoryId != null ? dropCategoryId() : this.dropCategoryId,
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
  bool _hasInitializedDefault = false;

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

  /// 取引タイプ（収入・支出・振替）の更新（切り替え時にデフォルトバケットを適用）
  void updateDropType(DropType type, {List<Bucket>? buckets}) {
    int? nextBucketId;
    int? nextToBucketId;

    if (buckets != null) {
      final defaultExpense =
          buckets.where((b) => b.isDefaultExpense == true).firstOrNull;
      final defaultIncome =
          buckets.where((b) => b.isDefaultIncome == true).firstOrNull;

      switch (type) {
        case DropType.expense:
          nextBucketId = defaultExpense?.id ?? state.bucketId;
          nextToBucketId = null;
        case DropType.income:
          nextBucketId = defaultIncome?.id ?? state.bucketId;
          nextToBucketId = null;
        case DropType.transfer:
          // 振替はデフォルトフラグを参照せず未選択にする
          nextBucketId = null;
          nextToBucketId = null;
      }
    } else {
      if (type == DropType.transfer) {
        nextBucketId = null;
        nextToBucketId = null;
      } else {
        nextBucketId = state.bucketId;
        nextToBucketId = null;
      }
    }

    state = state.copyWith(
      dropType: type,
      dropCategoryId: () => null,
      bucketId: () => nextBucketId,
      toBucketId: () => nextToBucketId,
    );
  }

  /// 初回ロード時のみデフォルトバケットを適用
  void applyInitialDefaultBuckets(List<Bucket> buckets) {
    if (_hasInitializedDefault) return;
    _hasInitializedDefault = true;

    final defaultExpense =
        buckets.where((b) => b.isDefaultExpense == true).firstOrNull;
    final defaultIncome =
        buckets.where((b) => b.isDefaultIncome == true).firstOrNull;

    switch (state.dropType) {
      case DropType.expense:
        if (state.bucketId == null && defaultExpense != null) {
          state = state.copyWith(bucketId: () => defaultExpense.id);
        }
      case DropType.income:
        if (state.bucketId == null && defaultIncome != null) {
          state = state.copyWith(bucketId: () => defaultIncome.id);
        }
      case DropType.transfer:
        break;
    }
  }

  /// カテゴリーIDの更新
  void updateDropCategoryId(int? dropCategoryId) {
    state = state.copyWith(dropCategoryId: () => dropCategoryId);
  }

  /// 出金元/対象バケットの更新
  void updateBucketId(int? bucketId) {
    state = state.copyWith(bucketId: () => bucketId);
  }

  /// 振替先バケットの更新
  void updateToBucketId(int? toBucketId) {
    state = state.copyWith(toBucketId: () => toBucketId);
  }

  /// 振替：出金元と入金先バケットをワンタップで入れ替え（Swap）
  void swapBuckets() {
    state = state.copyWith(
      bucketId: () => state.toBucketId,
      toBucketId: () => state.bucketId,
    );
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

  /// 取引の保存とフォームのリセット（バリデーションエラー時はメッセージを返却、成功時は null）
  Future<String?> save() async {
    final error = state.validationError;
    if (error != null) {
      return error;
    }

    final newDrop = Drop(
      title: state.title.trim(),
      amount: state.parsedAmount,
      dropCategoryId: state.dropCategoryId,
      bucketId: state.bucketId,
      toBucketId: state.dropType == DropType.transfer ? state.toBucketId : null,
      date: DateTime.now(),
    );

    await ref.read(dropRepositoryProvider).insertDrop(newDrop);

    // 状態を初期状態に戻す（選択中バケット・dropTypeは引き継ぎ、カテゴリー・タイトル・金額はクリア）
    state = TransactionInputState(
      dropType: state.dropType,
      bucketId: state.bucketId,
      toBucketId: state.toBucketId,
      resetKey: state.resetKey + 1,
    );

    return null; // 成功
  }
}
