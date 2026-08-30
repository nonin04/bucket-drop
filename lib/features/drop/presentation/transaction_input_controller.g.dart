// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_input_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionInputController)
final transactionInputControllerProvider =
    TransactionInputControllerProvider._();

final class TransactionInputControllerProvider
    extends
        $NotifierProvider<TransactionInputController, TransactionInputState> {
  TransactionInputControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionInputControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionInputControllerHash();

  @$internal
  @override
  TransactionInputController create() => TransactionInputController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionInputState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionInputState>(value),
    );
  }
}

String _$transactionInputControllerHash() =>
    r'100c6d29af2a2fea5bb91fc838e1d9b8ba7cc71d';

abstract class _$TransactionInputController
    extends $Notifier<TransactionInputState> {
  TransactionInputState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TransactionInputState, TransactionInputState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TransactionInputState, TransactionInputState>,
              TransactionInputState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
