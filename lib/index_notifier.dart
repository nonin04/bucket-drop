import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void setIndex(int newIndex) {
    state = newIndex;
    // ページを切り替え
    
  }
}

final indexProvider = NotifierProvider<IndexNotifier, int>(IndexNotifier.new);
