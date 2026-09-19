// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bucket_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bucketRepository)
final bucketRepositoryProvider = BucketRepositoryProvider._();

final class BucketRepositoryProvider
    extends
        $FunctionalProvider<
          BucketRepository,
          BucketRepository,
          BucketRepository
        >
    with $Provider<BucketRepository> {
  BucketRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bucketRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bucketRepositoryHash();

  @$internal
  @override
  $ProviderElement<BucketRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BucketRepository create(Ref ref) {
    return bucketRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BucketRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BucketRepository>(value),
    );
  }
}

String _$bucketRepositoryHash() => r'da4802a25bdc8ede53071337e8d065e913af792a';

@ProviderFor(bucketList)
final bucketListProvider = BucketListProvider._();

final class BucketListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Bucket>>,
          List<Bucket>,
          Stream<List<Bucket>>
        >
    with $FutureModifier<List<Bucket>>, $StreamProvider<List<Bucket>> {
  BucketListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bucketListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bucketListHash();

  @$internal
  @override
  $StreamProviderElement<List<Bucket>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Bucket>> create(Ref ref) {
    return bucketList(ref);
  }
}

String _$bucketListHash() => r'977a3aa99b57f72ec4096cb1a7cf6c84b59d5fa9';
