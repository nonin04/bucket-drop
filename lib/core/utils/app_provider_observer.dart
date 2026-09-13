import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Riverpod の全 Provider のライフサイクルやエラーを監視する Observer
/// (Spring の HandlerInterceptor や @ControllerAdvice に相当)
final class AppProviderObserver extends ProviderObserver {
  const AppProviderObserver();

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    debugPrint('❌ [Riverpod Provider Error]');
    debugPrint('Provider: ${context.provider.name ?? context.provider.runtimeType}');
    debugPrint('Error: $error');
    debugPrint('StackTrace:\n$stackTrace');
  }
}
