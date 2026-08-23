import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// build_runner用のpart指定
part 'calculator_controller.g.dart';

@riverpod
class Calculator extends _$Calculator {
  Timer? _timer;

  @override
  String build() {
    ref.onDispose(() {
      _timer?.cancel();
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

  void startAutoDelete() {
    _timer?.cancel();
    deleteDigit(); // 長押しがトリガーされた瞬間にまず1文字消す
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      deleteDigit();
    });
  }

  void stopAutoDelete() {
    _timer?.cancel();
    _timer = null;
  }
}
