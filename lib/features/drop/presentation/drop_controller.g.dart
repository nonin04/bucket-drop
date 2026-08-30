// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DropController)
final dropControllerProvider = DropControllerProvider._();

final class DropControllerProvider
    extends $AsyncNotifierProvider<DropController, void> {
  DropControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dropControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dropControllerHash();

  @$internal
  @override
  DropController create() => DropController();
}

String _$dropControllerHash() => r'3fb1ee61f7ddc41416849ed9268271fac119a4be';

abstract class _$DropController extends $AsyncNotifier<void> {
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
