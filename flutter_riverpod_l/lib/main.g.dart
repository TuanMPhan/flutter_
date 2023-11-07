// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchUserFutureHash() => r'f415cdc0e9cdbd44cb05ddd993455861cca2efa8';

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

/// FutureProvider: use for Future/ Asynchronous calls. Can be use for:
/// perform and cache asynchronous operations (such as network requests)
/// handle the error and loading states of asynchronous operations
/// combine multiple asynchronous values into another value
/// re-fetch and refresh data (useful for pull-to-refresh operations)
///
/// Copied from [fetchUserFuture].
@ProviderFor(fetchUserFuture)
const fetchUserFutureProvider = FetchUserFutureFamily();

/// FutureProvider: use for Future/ Asynchronous calls. Can be use for:
/// perform and cache asynchronous operations (such as network requests)
/// handle the error and loading states of asynchronous operations
/// combine multiple asynchronous values into another value
/// re-fetch and refresh data (useful for pull-to-refresh operations)
///
/// Copied from [fetchUserFuture].
class FetchUserFutureFamily extends Family<AsyncValue<UserFuture>> {
  /// FutureProvider: use for Future/ Asynchronous calls. Can be use for:
  /// perform and cache asynchronous operations (such as network requests)
  /// handle the error and loading states of asynchronous operations
  /// combine multiple asynchronous values into another value
  /// re-fetch and refresh data (useful for pull-to-refresh operations)
  ///
  /// Copied from [fetchUserFuture].
  const FetchUserFutureFamily();

  /// FutureProvider: use for Future/ Asynchronous calls. Can be use for:
  /// perform and cache asynchronous operations (such as network requests)
  /// handle the error and loading states of asynchronous operations
  /// combine multiple asynchronous values into another value
  /// re-fetch and refresh data (useful for pull-to-refresh operations)
  ///
  /// Copied from [fetchUserFuture].
  FetchUserFutureProvider call(
    String input,
  ) {
    return FetchUserFutureProvider(
      input,
    );
  }

  @override
  FetchUserFutureProvider getProviderOverride(
    covariant FetchUserFutureProvider provider,
  ) {
    return call(
      provider.input,
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
  String? get name => r'fetchUserFutureProvider';
}

/// FutureProvider: use for Future/ Asynchronous calls. Can be use for:
/// perform and cache asynchronous operations (such as network requests)
/// handle the error and loading states of asynchronous operations
/// combine multiple asynchronous values into another value
/// re-fetch and refresh data (useful for pull-to-refresh operations)
///
/// Copied from [fetchUserFuture].
class FetchUserFutureProvider extends AutoDisposeFutureProvider<UserFuture> {
  /// FutureProvider: use for Future/ Asynchronous calls. Can be use for:
  /// perform and cache asynchronous operations (such as network requests)
  /// handle the error and loading states of asynchronous operations
  /// combine multiple asynchronous values into another value
  /// re-fetch and refresh data (useful for pull-to-refresh operations)
  ///
  /// Copied from [fetchUserFuture].
  FetchUserFutureProvider(
    String input,
  ) : this._internal(
          (ref) => fetchUserFuture(
            ref as FetchUserFutureRef,
            input,
          ),
          from: fetchUserFutureProvider,
          name: r'fetchUserFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserFutureHash,
          dependencies: FetchUserFutureFamily._dependencies,
          allTransitiveDependencies:
              FetchUserFutureFamily._allTransitiveDependencies,
          input: input,
        );

  FetchUserFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.input,
  }) : super.internal();

  final String input;

  @override
  Override overrideWith(
    FutureOr<UserFuture> Function(FetchUserFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUserFutureProvider._internal(
        (ref) => create(ref as FetchUserFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        input: input,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserFuture> createElement() {
    return _FetchUserFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserFutureProvider && other.input == input;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, input.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUserFutureRef on AutoDisposeFutureProviderRef<UserFuture> {
  /// The parameter `input` of this provider.
  String get input;
}

class _FetchUserFutureProviderElement
    extends AutoDisposeFutureProviderElement<UserFuture>
    with FetchUserFutureRef {
  _FetchUserFutureProviderElement(super.provider);

  @override
  String get input => (origin as FetchUserFutureProvider).input;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
