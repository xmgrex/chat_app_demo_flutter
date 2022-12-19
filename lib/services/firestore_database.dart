import 'package:chat_app_demo_flutter/features/account/domain/app_user.dart';
import 'package:chat_app_demo_flutter/features/chats/domain/chat/chat_room.dart';
import 'package:chat_app_demo_flutter/features/chats/domain/participating_chat/participating_chat.dart';
import 'package:chat_app_demo_flutter/services/firestore_path.dart';
import 'package:chat_app_demo_flutter/utils/demo_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_service/firebase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_utils/flutter_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/message/domain/message.dart';
import '../features/top_level_providers.dart';

part 'firestore_database.g.dart';

class FirestoreDatabase {
  FirestoreDatabase({required this.uid});
  final String uid;

  final _service = FirestoreService.instance;

  Stream<List<AppUser>> watchContacts() async* {
    await Future.delayed(const Duration(seconds: 1));
    yield fakeUsers;
    // return _service.collectionStream(
    //   path: FirestorePath.contacts(uid),
    //   builder: ((data, documentID) => AppUser.fromJson(data!)),
    // );
  }

  Future<ChatRoom> fetchChatRoom(DocumentReference chatRef) async {
    return _service.getDocument(
      path: chatRef.path,
      builder: ((data, documentID) => ChatRoom.fromJson(data!)),
    );
  }

  Stream<List<ParticipatingChatRoom>> watchParticipatingChatRooms() {
    return _service.collectionStream(
      path: FirestorePath.participatingChats(uid),
      builder: ((data, documentID) {
        return ParticipatingChatRoom.fromJson(data!);
      }),
    );
  }

  Future<void> createChatRoom(ChatRoom chatRoom) async {
    final chatRef =
        _service.document(path: FirestorePath.chatRoom(chatRoom.id));
    await chatRef.set(
      chatRoom.toJson(),
      SetOptions(merge: true),
    );
  }

  Future<bool> chatRoomExists(ChatRoom chatRoom) async {
    final chatRef =
        _service.document(path: FirestorePath.chatRoom(chatRoom.id));
    return chatRef.get().then((value) => value.exists);
  }

  Future<void> cerateMessage(ChatRoom chatRoom, Message message) async {
    final messagesPath = FirestorePath.messages(chatRoom.id);
    await _service.collection(path: messagesPath).add(message.toJson());
  }

  Stream<List<Message>> watchMessages(String chatRoomId) {
    return _service.collectionStream(
      path: FirestorePath.messages(chatRoomId),
      builder: (data, documentID) {
        var message = Message.fromJson(data!);
        logger.info(message);
        return message = message.copyWith(id: documentID);
      },
      queryBuilder: (query) {
        return query.orderBy('createdAt');
      },
    );
  }

  Future<void> readMessage(ParticipatingChatRoom chatRoom) async {
    final firestore = FirestoreService.firestoreInstance;
    final batch = firestore.batch();

    final shardRef = FirestorePath.unreadMessageCounts(uid, chatRoom.id);
    final snapshot = await _service.collection(path: shardRef).get();
    for (var doc in snapshot.docs) {
      batch.delete(doc.reference);
    }

    final chatRoomPath = FirestorePath.participatingChatRoom(uid, chatRoom.id);
    final chatRoomRef = _service.document(path: chatRoomPath);
    batch.update(chatRoomRef, {'unreadMessageCount': 0});
    await batch.commit();
  }
}

final contactsStreamProvider = StreamProvider.autoDispose<List<AppUser>>((ref) {
  return ref.watch(databaseProvider)!.watchContacts();
});

final participatingChatRoomsProvider =
    StreamProvider.autoDispose<List<ParticipatingChatRoom>>((ref) {
  return ref.watch(databaseProvider)!.watchParticipatingChatRooms();
});

final messagesProvider =
    StreamProvider.autoDispose.family<List<Message>, String>((ref, chatRoomId) {
  return ref.watch(databaseProvider)!.watchMessages(chatRoomId);
});

@riverpod
Future<ChatRoom> chatRoom(Ref ref, DocumentReference chatRef) {
  return ref.read(databaseProvider)!.fetchChatRoom(chatRef);
}

@riverpod
Future<void> readMessage(Ref ref, ParticipatingChatRoom chatRoom) {
  return ref.read(databaseProvider)!.readMessage(chatRoom);
}
