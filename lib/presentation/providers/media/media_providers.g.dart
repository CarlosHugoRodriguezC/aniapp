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
String _$getHomeMediaListsHash() => r'b8a2fb735ebacf92c32873bf4fbb86a22abb2cb0';

/// See also [getHomeMediaLists].
@ProviderFor(getHomeMediaLists)
final getHomeMediaListsProvider =
    AutoDisposeFutureProvider<HomeListsEntity>.internal(
  getHomeMediaLists,
  name: r'getHomeMediaListsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getHomeMediaListsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetHomeMediaListsRef = AutoDisposeFutureProviderRef<HomeListsEntity>;
String _$getTheMostPopularMediaHash() =>
    r'895af95e970f1da5bb391480e203d3d861c72882';

/// See also [getTheMostPopularMedia].
@ProviderFor(getTheMostPopularMedia)
final getTheMostPopularMediaProvider =
    AutoDisposeFutureProvider<MediaEntity>.internal(
  getTheMostPopularMedia,
  name: r'getTheMostPopularMediaProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getTheMostPopularMediaHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTheMostPopularMediaRef = AutoDisposeFutureProviderRef<MediaEntity>;
String _$getMediaListHash() => r'9b3e1c39c2c449950990953c162ad3ed841958c1';

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
String _$getMediaTrendsHash() => r'fde9fae405c21b9f38df02d6b376b3fbda7d5254';

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
String _$getMediaPopularOfSeasonYearHash() =>
    r'69553080b182a54294ee832b73be45512f3093ea';

/// See also [getMediaPopularOfSeasonYear].
@ProviderFor(getMediaPopularOfSeasonYear)
final getMediaPopularOfSeasonYearProvider =
    AutoDisposeFutureProvider<MediaEntity>.internal(
  getMediaPopularOfSeasonYear,
  name: r'getMediaPopularOfSeasonYearProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getMediaPopularOfSeasonYearHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMediaPopularOfSeasonYearRef
    = AutoDisposeFutureProviderRef<MediaEntity>;
String _$getMediaByIdHash() => r'd0909ac02541635409c861086d1c1b3441856512';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getMediaById].
@ProviderFor(getMediaById)
const getMediaByIdProvider = GetMediaByIdFamily();

/// See also [getMediaById].
class GetMediaByIdFamily extends Family<AsyncValue<MediaEntity>> {
  /// See also [getMediaById].
  const GetMediaByIdFamily();

  /// See also [getMediaById].
  GetMediaByIdProvider call(
    int id,
  ) {
    return GetMediaByIdProvider(
      id,
    );
  }

  @override
  GetMediaByIdProvider getProviderOverride(
    covariant GetMediaByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getMediaByIdProvider';
}

/// See also [getMediaById].
class GetMediaByIdProvider extends AutoDisposeFutureProvider<MediaEntity> {
  /// See also [getMediaById].
  GetMediaByIdProvider(
    int id,
  ) : this._internal(
          (ref) => getMediaById(
            ref as GetMediaByIdRef,
            id,
          ),
          from: getMediaByIdProvider,
          name: r'getMediaByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMediaByIdHash,
          dependencies: GetMediaByIdFamily._dependencies,
          allTransitiveDependencies:
              GetMediaByIdFamily._allTransitiveDependencies,
          id: id,
        );

  GetMediaByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<MediaEntity> Function(GetMediaByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMediaByIdProvider._internal(
        (ref) => create(ref as GetMediaByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MediaEntity> createElement() {
    return _GetMediaByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMediaByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMediaByIdRef on AutoDisposeFutureProviderRef<MediaEntity> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetMediaByIdProviderElement
    extends AutoDisposeFutureProviderElement<MediaEntity> with GetMediaByIdRef {
  _GetMediaByIdProviderElement(super.provider);

  @override
  int get id => (origin as GetMediaByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
