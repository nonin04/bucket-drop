// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DropFormController)
final dropFormControllerProvider = DropFormControllerProvider._();

final class DropFormControllerProvider
    extends $AsyncNotifierProvider<DropFormController, void> {
  DropFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dropFormControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dropFormControllerHash();

  @$internal
  @override
  DropFormController create() => DropFormController();
}

String _$dropFormControllerHash() =>
    r'cae7b9463452ad1752b1f8af3bb6ea504f67f1a8';

abstract class _$DropFormController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
