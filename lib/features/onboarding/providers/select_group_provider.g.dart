// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_group_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$setSelectedGroupNumberHash() =>
    r'6b1a236a5ff6d1d49af9a3da6c9498315536494c';

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

/// See also [setSelectedGroupNumber].
@ProviderFor(setSelectedGroupNumber)
const setSelectedGroupNumberProvider = SetSelectedGroupNumberFamily();

/// See also [setSelectedGroupNumber].
class SetSelectedGroupNumberFamily extends Family<AsyncValue<void>> {
  /// See also [setSelectedGroupNumber].
  const SetSelectedGroupNumberFamily();

  /// See also [setSelectedGroupNumber].
  SetSelectedGroupNumberProvider call({
    required String groupNumber,
  }) {
    return SetSelectedGroupNumberProvider(
      groupNumber: groupNumber,
    );
  }

  @override
  SetSelectedGroupNumberProvider getProviderOverride(
    covariant SetSelectedGroupNumberProvider provider,
  ) {
    return call(
      groupNumber: provider.groupNumber,
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
  String? get name => r'setSelectedGroupNumberProvider';
}

/// See also [setSelectedGroupNumber].
class SetSelectedGroupNumberProvider extends AutoDisposeFutureProvider<void> {
  /// See also [setSelectedGroupNumber].
  SetSelectedGroupNumberProvider({
    required String groupNumber,
  }) : this._internal(
          (ref) => setSelectedGroupNumber(
            ref as SetSelectedGroupNumberRef,
            groupNumber: groupNumber,
          ),
          from: setSelectedGroupNumberProvider,
          name: r'setSelectedGroupNumberProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setSelectedGroupNumberHash,
          dependencies: SetSelectedGroupNumberFamily._dependencies,
          allTransitiveDependencies:
              SetSelectedGroupNumberFamily._allTransitiveDependencies,
          groupNumber: groupNumber,
        );

  SetSelectedGroupNumberProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupNumber,
  }) : super.internal();

  final String groupNumber;

  @override
  Override overrideWith(
    FutureOr<void> Function(SetSelectedGroupNumberRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetSelectedGroupNumberProvider._internal(
        (ref) => create(ref as SetSelectedGroupNumberRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupNumber: groupNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SetSelectedGroupNumberProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetSelectedGroupNumberProvider &&
        other.groupNumber == groupNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetSelectedGroupNumberRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `groupNumber` of this provider.
  String get groupNumber;
}

class _SetSelectedGroupNumberProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with SetSelectedGroupNumberRef {
  _SetSelectedGroupNumberProviderElement(super.provider);

  @override
  String get groupNumber =>
      (origin as SetSelectedGroupNumberProvider).groupNumber;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
