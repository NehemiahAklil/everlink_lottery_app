// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_ticket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedEntryTicketsHash() =>
    r'bbd42d7e54d98afec3bdf87447083467fd09029f';

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

/// See also [selectedEntryTickets].
@ProviderFor(selectedEntryTickets)
const selectedEntryTicketsProvider = SelectedEntryTicketsFamily();

/// See also [selectedEntryTickets].
class SelectedEntryTicketsFamily extends Family<AsyncValue<List<EntryTicket>>> {
  /// See also [selectedEntryTickets].
  const SelectedEntryTicketsFamily();

  /// See also [selectedEntryTickets].
  SelectedEntryTicketsProvider call({
    required String lotteryId,
  }) {
    return SelectedEntryTicketsProvider(
      lotteryId: lotteryId,
    );
  }

  @override
  SelectedEntryTicketsProvider getProviderOverride(
    covariant SelectedEntryTicketsProvider provider,
  ) {
    return call(
      lotteryId: provider.lotteryId,
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
  String? get name => r'selectedEntryTicketsProvider';
}

/// See also [selectedEntryTickets].
class SelectedEntryTicketsProvider
    extends AutoDisposeFutureProvider<List<EntryTicket>> {
  /// See also [selectedEntryTickets].
  SelectedEntryTicketsProvider({
    required String lotteryId,
  }) : this._internal(
          (ref) => selectedEntryTickets(
            ref as SelectedEntryTicketsRef,
            lotteryId: lotteryId,
          ),
          from: selectedEntryTicketsProvider,
          name: r'selectedEntryTicketsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedEntryTicketsHash,
          dependencies: SelectedEntryTicketsFamily._dependencies,
          allTransitiveDependencies:
              SelectedEntryTicketsFamily._allTransitiveDependencies,
          lotteryId: lotteryId,
        );

  SelectedEntryTicketsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lotteryId,
  }) : super.internal();

  final String lotteryId;

  @override
  Override overrideWith(
    FutureOr<List<EntryTicket>> Function(SelectedEntryTicketsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SelectedEntryTicketsProvider._internal(
        (ref) => create(ref as SelectedEntryTicketsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lotteryId: lotteryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<EntryTicket>> createElement() {
    return _SelectedEntryTicketsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedEntryTicketsProvider &&
        other.lotteryId == lotteryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lotteryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SelectedEntryTicketsRef
    on AutoDisposeFutureProviderRef<List<EntryTicket>> {
  /// The parameter `lotteryId` of this provider.
  String get lotteryId;
}

class _SelectedEntryTicketsProviderElement
    extends AutoDisposeFutureProviderElement<List<EntryTicket>>
    with SelectedEntryTicketsRef {
  _SelectedEntryTicketsProviderElement(super.provider);

  @override
  String get lotteryId => (origin as SelectedEntryTicketsProvider).lotteryId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
