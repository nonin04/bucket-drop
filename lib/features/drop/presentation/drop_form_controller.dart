import 'package:bucket_drop/features/drop/data/drop_repository.dart';
import 'package:bucket_drop/features/drop/domain/drop.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drop_form_controller.g.dart';

@riverpod
class DropFormController extends _$DropFormController {
  @override
  FutureOr<void> build() {
    //画面を開いた瞬間は「何もしない(ロード待ちにしない)」
    return null;
  }

  // ドロップの保存
  Future<bool> saveDrop(Drop drop) async {
    // 1. ロード中
    state = const AsyncLoading();

    // AsyncValue.guard で囲むと、成功・例外エラーを自動で AsyncValue に変換してくれる
    state = await AsyncValue.guard(
      () => ref.read(dropRepositoryProvider).createDrop(drop),
    );

    // 成功/失敗を UI に伝えるために bool を返す
    return state.hasValue; // true:成功, false:失敗
  }

  // ドロップの更新
  Future<bool> updateDrop(Drop drop) async {
    // 1. ロード中
    state = const AsyncLoading();

    // AsyncValue.guard で囲むと、成功・例外エラーを自動で AsyncValue に変換してくれる
    state = await AsyncValue.guard(
      () => ref.read(dropRepositoryProvider).updateDrop(drop),
    );

    // 成功/失敗を UI に伝えるために bool を返す
    return state.hasValue; // true:成功, false:失敗
  }
}
