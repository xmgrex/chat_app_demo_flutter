// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_database.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String $chatRoomHash() => r'e062fcf65ee77647378fa61b2187abd17bfb367f';

/// See also [chatRoom].
class ChatRoomProvider extends AutoDisposeFutureProvider<ChatRoom> {
  ChatRoomProvider(
    this.chatRef,
  ) : super(
          (ref) => chatRoom(
            ref,
            chatRef,
          ),
          from: chatRoomProvider,
          name: r'chatRoomProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $chatRoomHash,
        );

  final DocumentReference<Object?> chatRef;

  @override
  bool operator ==(Object other) {
    return other is ChatRoomProvider && other.chatRef == chatRef;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatRef.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ChatRoomRef = AutoDisposeFutureProviderRef<ChatRoom>;

/// See also [chatRoom].
final chatRoomProvider = ChatRoomFamily();

class ChatRoomFamily extends Family<AsyncValue<ChatRoom>> {
  ChatRoomFamily();

  ChatRoomProvider call(
    DocumentReference<Object?> chatRef,
  ) {
    return ChatRoomProvider(
      chatRef,
    );
  }

  @override
  AutoDisposeFutureProvider<ChatRoom> getProviderOverride(
    covariant ChatRoomProvider provider,
  ) {
    return call(
      provider.chatRef,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'chatRoomProvider';
}

String $readMessageHash() => r'90ff2750a0f2990a5186eb79081204ce0dbcd050';

/// See also [readMessage].
class ReadMessageProvider extends AutoDisposeFutureProvider<void> {
  ReadMessageProvider(
    this.chatRoom,
  ) : super(
          (ref) => readMessage(
            ref,
            chatRoom,
          ),
          from: readMessageProvider,
          name: r'readMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $readMessageHash,
        );

  final ParticipatingChatRoom chatRoom;

  @override
  bool operator ==(Object other) {
    return other is ReadMessageProvider && other.chatRoom == chatRoom;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatRoom.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ReadMessageRef = AutoDisposeFutureProviderRef<void>;

/// See also [readMessage].
final readMessageProvider = ReadMessageFamily();

class ReadMessageFamily extends Family<AsyncValue<void>> {
  ReadMessageFamily();

  ReadMessageProvider call(
    ParticipatingChatRoom chatRoom,
  ) {
    return ReadMessageProvider(
      chatRoom,
    );
  }

  @override
  AutoDisposeFutureProvider<void> getProviderOverride(
    covariant ReadMessageProvider provider,
  ) {
    return call(
      provider.chatRoom,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'readMessageProvider';
}
