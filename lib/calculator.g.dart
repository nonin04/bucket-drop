// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Calculator)
final calculatorProvider = CalculatorProvider._();

final class CalculatorProvider extends $NotifierProvider<Calculator, String> {
  CalculatorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calculatorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calculatorHash();

  @$internal
  @override
  Calculator create() => Calculator();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$calculatorHash() => r'5253dfdf0e50f43860bc1486489913ce96dccd77';

abstract class _$Calculator extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
