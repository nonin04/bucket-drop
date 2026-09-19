// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_category_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dropCategoryRepository)
final dropCategoryRepositoryProvider = DropCategoryRepositoryProvider._();

final class DropCategoryRepositoryProvider
    extends
        $FunctionalProvider<
          DropCategoryRepository,
          DropCategoryRepository,
          DropCategoryRepository
        >
    with $Provider<DropCategoryRepository> {
  DropCategoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dropCategoryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dropCategoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<DropCategoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DropCategoryRepository create(Ref ref) {
    return dropCategoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DropCategoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DropCategoryRepository>(value),
    );
  }
}

String _$dropCategoryRepositoryHash() =>
    r'6e0743ef096b6d80981e9171b48ec758a8ae3c59';

@ProviderFor(dropCategoryList)
final dropCategoryListProvider = DropCategoryListProvider._();

final class DropCategoryListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DropCategory>>,
          List<DropCategory>,
          Stream<List<DropCategory>>
        >
    with
        $FutureModifier<List<DropCategory>>,
        $StreamProvider<List<DropCategory>> {
  DropCategoryListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dropCategoryListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dropCategoryListHash();

  @$internal
  @override
  $StreamProviderElement<List<DropCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<DropCategory>> create(Ref ref) {
    return dropCategoryList(ref);
  }
}

String _$dropCategoryListHash() => r'007df97e7399c1620c4346db6d468add4b9fc9bf';
