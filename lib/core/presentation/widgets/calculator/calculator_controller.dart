import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// build_runner用のpart指定
part 'calculator_controller.g.dart';

@riverpod
class Calculator extends _$Calculator {
  Timer? _initialDelayTimer;
  Timer? _repeatTimer;

  @override
  String build() {
    ref.onDispose(() {
      _initialDelayTimer?.cancel();
      _repeatTimer?.cancel();
    });
    return '0';
  }

  void inputDigit(String digit) {
    const maxDigit = 10;
    if (state.length >= maxDigit) {
      return;
    }

    if (state == '0') {
      state = digit;
    } else {
      state = state + digit;
    }
  }

  void clear() {
    state = '0';
  }

  void deleteDigit() {
    if (state.length <= 1) {
      state = '0';
    } else {
      state = state.substring(0, state.length - 1);
    }
  }

  /// タップダウン時に即座に1桁消し、長押しされたら連続削除を開始
  void startDelete() {
    deleteDigit();
    _initialDelayTimer?.cancel();
    _repeatTimer?.cancel();
    _initialDelayTimer = Timer(const Duration(milliseconds: 400), () {
      _repeatTimer = Timer.periodic(const Duration(milliseconds: 80), (timer) {
        deleteDigit();
      });
    });
  }

  /// 指を離した時・タップキャンセル時にタイマーを停止
  void stopDelete() {
    _initialDelayTimer?.cancel();
    _initialDelayTimer = null;
    _repeatTimer?.cancel();
    _repeatTimer = null;
  }
}
