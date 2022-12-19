import 'package:chat_app_demo_flutter/services/firestore_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reusable_widgets/flutter_reusable_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_utils/flutter_utils.dart';

import 'chat_room_stack.dart';
import 'chats_list_view_builder.dart';

class ChatRoomsListView extends ConsumerWidget {
  const ChatRoomsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final participatingChatRoomsValue =
        ref.watch(participatingChatRoomsProvider);
    return AsyncValueWidget(
      value: participatingChatRoomsValue,
      data: (participatingChatRooms) {
        // logger.info(participatingChatRooms);
        return participatingChatRooms.isEmpty
            ? const Expanded(child: Center(child: Text('チャットを始めましょう。')))
            : ChatsListViewBuilder(
                participatingChatRooms: participatingChatRooms,
                itemBuilder: (context, index, participatingChat) {
                  return ChatRoomStack(
                      participatingChatRoom: participatingChat);
                },
              );
      },
    );
  }
}
