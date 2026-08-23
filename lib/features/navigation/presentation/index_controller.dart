import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void setIndex(int newIndex) {
    state = newIndex;
  }
}

final indexProvider = NotifierProvider<IndexNotifier, int>(IndexNotifier.new);
