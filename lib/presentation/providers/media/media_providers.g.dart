// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMediaRepositoryHash() =>
    r'763f6be4ea23347f7a2528c7efc2ed1cdcc75653';

/// See also [getMediaRepository].
@ProviderFor(getMediaRepository)
final getMediaRepositoryProvider =
    AutoDisposeProvider<MediaRepository>.internal(
  getMediaRepository,
  name: r'getMediaRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getMediaRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMediaRepositoryRef = AutoDisposeProviderRef<MediaRepository>;
String _$getMediaListHash() => r'32fb4288cd403fbc6e5113ce34d6361cb5df994e';

/// See also [getMediaList].
@ProviderFor(getMediaList)
final getMediaListProvider =
    AutoDisposeFutureProvider<List<MediaEntity>>.internal(
  getMediaList,
  name: r'getMediaListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getMediaListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMediaListRef = AutoDisposeFutureProviderRef<List<MediaEntity>>;
String _$getMediaTrendsHash() => r'15fe43d59c2eeec0fd300daa8adcf939d7e68c61';

/// See also [getMediaTrends].
@ProviderFor(getMediaTrends)
final getMediaTrendsProvider =
    AutoDisposeFutureProvider<List<MediaEntity>>.internal(
  getMediaTrends,
  name: r'getMediaTrendsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getMediaTrendsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMediaTrendsRef = AutoDisposeFutureProviderRef<List<MediaEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member