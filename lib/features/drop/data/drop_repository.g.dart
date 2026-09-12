// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dropRepository)
final dropRepositoryProvider = DropRepositoryProvider._();

final class DropRepositoryProvider
    extends $FunctionalProvider<DropRepository, DropRepository, DropRepository>
    with $Provider<DropRepository> {
  DropRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dropRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dropRepositoryHash();

  @$internal
  @override
  $ProviderElement<DropRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DropRepository create(Ref ref) {
    return dropRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DropRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DropRepository>(value),
    );
  }
}

String _$dropRepositoryHash() => r'2a5dccfe19057162b983df47b99099689033810e';
