import 'package:flutter_riverpod/flutter_riverpod.dart';

class BooleanNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

final booleanProvider = NotifierProvider<BooleanNotifier, bool>(BooleanNotifier.new);
