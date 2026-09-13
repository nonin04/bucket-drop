// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_index_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DropIndexController)
final dropIndexControllerProvider = DropIndexControllerProvider._();

final class DropIndexControllerProvider
    extends $AsyncNotifierProvider<DropIndexController, List<Drop>> {
  DropIndexControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dropIndexControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dropIndexControllerHash();

  @$internal
  @override
  DropIndexController create() => DropIndexController();
}

String _$dropIndexControllerHash() =>
    r'19a4d649b695c9f0be5cfbf3fb1cec378f191c99';

abstract class _$DropIndexController extends $AsyncNotifier<List<Drop>> {
  FutureOr<List<Drop>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Drop>>, List<Drop>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Drop>>, List<Drop>>,
              AsyncValue<List<Drop>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
