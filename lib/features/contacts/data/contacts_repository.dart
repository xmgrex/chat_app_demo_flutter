import 'package:chat_app_demo_flutter/features/chats/domain/chat/chat_room.dart';
import 'package:chat_app_demo_flutter/features/top_level_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_utils/flutter_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contacts_repository.g.dart';

class ContactsRepository {
  ContactsRepository(this.ref);
  final Ref ref;

  Future<void> createChatRoom(ChatRoom chatRoom) async {
    final db = ref.read(databaseProvider)!;
    await db.createChatRoom(chatRoom);
    // try {
    //   final isExists = await db.chatRoomExists(chatRoom);
    //   logger.info(isExists);
    //   if (!isExists) await db.createChatRoom(chatRoom);
    // } catch (e) {
    //   return Future.error(e.toString());
    // }
  }
}

@riverpod
ContactsRepository contactsRepository(Ref ref) {
  return ContactsRepository(ref);
}
